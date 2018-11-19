//
//  NetworkController.swift
//  NYAPIAssigment
//
//  Created by Silver Shark on 18/11/18.
//  Copyright © 2018 DevangTandel. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

protocol NetworkRequest: class {
    associatedtype Model
    func load(withCompletion completion: @escaping (Model?, _ error : WebError?) -> Void)
    func decode(_ data: Data) -> Model?
}

extension NetworkRequest {
    
    fileprivate func load(_ url: URL, withCompletion completion: @escaping (Model?, _ errorMessage : WebError?) -> Void) {
        
        
        Alamofire.request(url, method: .get , parameters: [:], encoding: URLEncoding.default)
            .responseJSON { response in
                
                ShowNetworkIndicator(false)
                
                print("Request Data: \(response.request?.httpMethod! ?? "") - \(response.request?.url!.absoluteString ?? "")?\(response.request?.httpBody.map { body in String(data: body, encoding: .utf8) ?? "" } ?? "")")
                
                if response.response?.statusCode == 200 {
                    
                    if let data = response.data {
                        completion(self.decode(data), nil)
                    } else {
                        completion(nil, .invalidData)
                    }
                }else if response.response?.statusCode == 401 {
                    completion(nil, .invalidAPIKey)
                } else {
                    completion(nil, .responseUnsuccessful)
                }
        }
    }
}

class ApiRequest<Resource: APIResource> {
    
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension ApiRequest: NetworkRequest {
    
    func decode(_ data: Data) -> Resource.Model? {
        return resource.makeModel(data: data)
    }
    
    func load(withCompletion completion: @escaping (Resource.Model?, _ error : WebError?) -> Void) {
        load(resource.url, withCompletion: completion)
    }
}



