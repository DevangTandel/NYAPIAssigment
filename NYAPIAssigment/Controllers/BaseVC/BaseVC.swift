//
//  BaseVC.swift
//  NYAPIAssigment
//
//  Created by Silver Shark on 18/11/18.
//  Copyright © 2018 DevangTandel. All rights reserved.
//

import UIKit

class BaseVC: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    //MARK:- Set NavigationBar
    func setNavigationbarWith(_ left_imagename: String,
                                    left_action: Selector?,
                                    rightButtons: [String],
                                    rightActions: [Selector],
                                    navTitle: String){
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.5
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
        
        if left_imagename.count > 0  {
            
            let btnleft: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            btnleft.setImage( UIImage(named: left_imagename), for: .normal)
            if left_action != nil {
                btnleft.addTarget(self, action: left_action! , for: .touchDown)
            }
            let backBarButon: UIBarButtonItem = UIBarButtonItem(customView: btnleft)
            self.navigationItem.leftBarButtonItems = [backBarButon]
            
        } else {
            self.navigationItem.hidesBackButton = true
            self.navigationItem.leftBarButtonItems = nil
        }
        
        var rightBarItems = [UIBarButtonItem]()
        
        for index in 0..<rightButtons.count {
            
            let btnadd: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            btnadd.setImage(UIImage(named: rightButtons[index]), for: .normal)
            btnadd.addTarget(self, action: rightActions[index], for: .touchDown)
            rightBarItems.append(UIBarButtonItem(customView: btnadd))
        }
        self.navigationItem.rightBarButtonItems = rightBarItems
        self.title = navTitle
    }

}

extension BaseVC {
    
    @objc func goBackToPreviousVC(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func dismisCurrentVC(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
