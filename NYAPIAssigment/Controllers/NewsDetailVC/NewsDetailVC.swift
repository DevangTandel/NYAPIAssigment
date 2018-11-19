//
//  NewsDetailVC.swift
//  NYAPIAssigment
//
//  Created by Silver Shark on 18/11/18.
//  Copyright © 2018 DevangTandel. All rights reserved.
//

import UIKit

class NewsDetailVC: BaseVC {

    var ObjectNews : NewsResult!
    
    @IBOutlet weak var tblNews: UITableView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var imgNews: UIImageView!
    
    //MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - VIEW WILL APPEAR
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //Set Navigaton Bar with 1 left button , Title and 2 Right Button and actions
        setNavigationbarWith("icon_Back", left_action: #selector(goBackToPreviousVC), rightButtons: [], rightActions: [], navTitle: ObjectNews.title ?? "")
        imgNews.backgroundColor = UIColor(0.2)
        if let mediaUrl = ObjectNews.media?.first?.mediaMetadata?.first?.url {
            imgNews.loadImageAsync(with: mediaUrl)
        }
        
        if let width = ObjectNews.media?.first?.mediaMetadata?.first?.width, let height = ObjectNews.media?.first?.mediaMetadata?.first?.height {
            let imageAspect = CGFloat(height/width)
            viewHeader.frame = CGRect(x: 0, y: 0, width: SCREENWIDTH(), height: SCREENWIDTH()*imageAspect)
        }else{
            viewHeader.frame = CGRect(x: 0, y: 0, width: SCREENWIDTH(), height: 0)
        }
        
        tblNews.reloadData()
    }
    
    @IBAction func btnReadMoreTapped(_ sender: Any) {
        
        guard let url : URL = URL(string: ObjectNews.url ?? "") else {
            showAppAlertWithMessage("Not Able to open link", viewController: self)
            return
        }
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension NewsDetailVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDetail", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = ObjectNews.title ?? ""
            cell.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            break
        case 1:
            cell.textLabel?.text = ObjectNews.byline ?? "By Times"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            cell.textLabel?.textColor = .lightGray
            break
        case 2:
            cell.textLabel?.text = ObjectNews.abstractField ?? ""
            cell.textLabel?.textColor = .gray
        default:
            break
        }
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.sizeToFit()
        return cell
    }
}



