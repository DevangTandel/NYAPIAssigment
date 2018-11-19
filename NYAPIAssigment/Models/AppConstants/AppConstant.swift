//
//  AppConstant.swift
//  NYAPIAssigment
//
//  Created by Silver Shark on 18/11/18.
//  Copyright © 2018 DevangTandel. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration


let APP_DELEGATE = UIApplication.shared.delegate as! AppDelegate
public let APP_NAME: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? ""
public let API_KEY = "65cfa4884d78480ebd476c21a9df7106"

let URL_BASE = "http://api.nytimes.com/"

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

struct AppUI {
    
    struct Storyboard {
        static let SB_News = "NewsStoryboard"
    }
    struct ViewControllers {
        static let VCNewsDetails = "idNewsDetailVC"
    }
}

//MARK: - CUSTOM ALERT
func showAppAlertWithMessage(_ message:String, viewController : UIViewController?)  {
    let noInternet = UIAlertController(title: APP_NAME, message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "Dismiss", style: .default) { (_) in
    }
    noInternet.addAction(ok)
    if viewController == nil {
        APP_DELEGATE.window?.rootViewController?.present(noInternet, animated: true, completion: nil)
    }else{
        viewController?.present(noInternet, animated: true, completion: nil)
    }
    
}

func showNoInternetAlert()  {
    let noInternet = UIAlertController()
    let ok = UIAlertAction(title: "Dismiss", style: .default) { (_) in
    }
    noInternet.addAction(ok)
    noInternet.title = APP_NAME
    noInternet.message = "No internet available at this moment, Please check your network connection"
    APP_DELEGATE.window?.rootViewController?.present(noInternet, animated: true, completion: nil)
}

//MARK: - Check Internet connection
func isConnectedToNetwork() -> Bool {
    var zeroAddress = sockaddr_in()
    zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
    zeroAddress.sin_family = sa_family_t(AF_INET)
    let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
        $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
            SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
        }
    }
    var flags = SCNetworkReachabilityFlags()
    if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
        return false
    }
    let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
    let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
    return (isReachable && !needsConnection)
}


