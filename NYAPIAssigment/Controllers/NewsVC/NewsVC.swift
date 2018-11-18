//
//  NewsVC.swift
//  NYAPIAssigment
//
//  Created by Silver Shark on 18/11/18.
//  Copyright © 2018 DevangTandel. All rights reserved.
//

import UIKit

class NewsVC: BaseVC {

    //MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - VIEW WILL APPEAR
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
