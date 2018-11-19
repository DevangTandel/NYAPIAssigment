//
//  NewsVC.swift
//  NYAPIAssigment
//
//  Created by Silver Shark on 18/11/18.
//  Copyright © 2018 DevangTandel. All rights reserved.
//

import UIKit

class NewsVC: BaseVC {

    @IBOutlet weak var tableNews : UITableView!
    @IBOutlet weak var lblNoData: UILabel!
    
    var dataSource: NewsDataSource!
    var tblDelegate: NewsTableDelegate!
    fileprivate var request: Any?
    var refreshController : UIRefreshControl!
    var isRefreshing = false
    
    //MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = NewsDataSource(news: [])
        tblDelegate = NewsTableDelegate(tableView: tableNews, news: [])
        tableNews.dataSource = dataSource
        tableNews.delegate = tblDelegate
        tableNews.reloadData()
        
        refreshController = UIRefreshControl()
        refreshController.tintColor = AppColor.AppNavigationColor
        refreshController.addTarget(self, action: #selector(fetchNews), for: .valueChanged)
        tableNews.addSubview(refreshController)
        fetchNews()
    }
    
    //MARK: - VIEWWILLAPPEAR
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //Set Navigaton Bar with 1 left button , Title and 2 Right Button and actions
        setNavigationbarWith("icon_Menu", left_action: nil, rightButtons: ["icon_Sort","icon_Search"], rightActions: [#selector(sortNewsTapped(_:)), #selector(SearchTapped(_:))], navTitle: "NY Times Most Popular")
    }

}

extension NewsVC {
    
    @IBAction func sortNewsTapped( _ sender : UIButton){
        print("sortTapped")
        
    }
    
    @IBAction func SearchTapped( _ sender : UIButton){
        print("SearchTapped")
    }
    
}

private extension NewsVC {
    
    @objc func fetchNews(){
        
        if isRefreshing {
            return
        }
        
        if isConnectedToNetwork(){
            isRefreshing = true
            self.addActivity(view: self.view, enable: true)
            var newsListResource = NewsResource()
            newsListResource.timeFrame = "30"
            let newsRequest = ApiRequest(resource: newsListResource)
            request = newsRequest
            newsRequest.load { newsResponse,error  in
                
                self.refreshController.endRefreshing()
                self.isRefreshing = false
                self.addActivity(view: self.view, enable: false)
                if error != nil {
                    DispatchQueue.main.async {
                        showAppAlertWithMessage("\(error!)", viewController: self)
                        return
                    }
                }else{
                    if let news : NewsResponse = newsResponse! {
                        self.dataSource.arrNews.removeAll()
                        self.tblDelegate.news.removeAll()
                        self.dataSource.arrNews.append(contentsOf: news.results ?? [])
                        self.tblDelegate.news.append(contentsOf: news.results ?? [])
                        DispatchQueue.main.async {
                            self.tableNews.reloadData()
                            self.lblNoData.isHidden = news.results!.count > 0 ? true : false
                        }
                    }
                }
            }
            
        }else{
            self.refreshController.endRefreshing()
            self.isRefreshing = false
            showNoInternetAlert()
        }
    }
}

extension NewsTableDelegate : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let newsDetail = loadVC(AppUI.Storyboard.SB_News, strVCId: AppUI.ViewControllers.VCNewsDetails) as! NewsDetailVC
        newsDetail.ObjectNews = news[indexPath.row]
        if let topVC = APP_DELEGATE.window?.rootViewController as? UINavigationController {
            topVC.topViewController?.navigationController?.pushViewController(newsDetail, animated: true)
        }
    }
}

extension UIViewController {
    
    func addActivity(view:UIView , enable:Bool) {
        //Create Activity Indicator
        let myActivityIndicator = UIActivityIndicatorView(style: .gray)
        myActivityIndicator.center = CGPoint(x: SCREENWIDTH()/2, y: SCREENHEIGHT()/2 - 50 )
        myActivityIndicator.hidesWhenStopped = false
        myActivityIndicator.startAnimating()
        myActivityIndicator.color = AppColor.AppNavigationColor
        myActivityIndicator.transform = CGAffineTransform(scaleX: 2, y: 2)
        
        if enable == true {
            view.addSubview(myActivityIndicator)
        } else {
            for view in view.subviews {
                if view .isKind(of: UIActivityIndicatorView.self) {
                    view.removeFromSuperview()
                }
            }
        }
    }
}
