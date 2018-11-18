//
//  AppConstant.swift
//  NYAPIAssigment
//
//  Created by Silver Shark on 18/11/18.
//  Copyright © 2018 DevangTandel. All rights reserved.
//

import Foundation
import UIKit


let APP_DELEGATE = UIApplication.shared.delegate as! AppDelegate
public let APP_NAME: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? ""
public let API_KEY = "http://api.nytimes.com/svc/mostpopular/v2"

let URL_BASE = "http://api.nytimes.com/svc/mostpopular/v2"

//MARK: -  GET VC FOR NAVIGATION
public func getStoryboard(_ storyboardName: String) -> UIStoryboard {
    return UIStoryboard(name: "\(storyboardName)", bundle: nil)
}

public func loadVC(_ strStoryboardId: String, strVCId: String) -> UIViewController {
    return getStoryboard(strStoryboardId).instantiateViewController(withIdentifier: strVCId)
}

//MARK: - Get full screen size
public func fixedScreenSize() -> CGSize {
    let screenSize = UIScreen.main.bounds.size
    if NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1 && UIDevice.current.orientation.isLandscape {
        return CGSize(width: screenSize.height, height: screenSize.width)
    }
    return screenSize
}

public func SCREENWIDTH() -> CGFloat{
    return fixedScreenSize().width
}

public func SCREENHEIGHT() -> CGFloat{
    return fixedScreenSize().height
}


//MARK: - Network indicator
public func ShowNetworkIndicator(_ isVisible :Bool){
    
    DispatchQueue.main.async(execute: {
         UIApplication.shared.isNetworkActivityIndicatorVisible = isVisible
    })
}


struct AppColor {
    static let AppNavigationColor = UIColor(red: 80/225, green: 227/225, blue: 195/225, alpha: 1.0)
}

