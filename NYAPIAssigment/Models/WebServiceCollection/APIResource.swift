//
//  APIResource.swift
//  NYAPIAssigment
//
//  Created by Silver Shark on 18/11/18.
//  Copyright © 2018 DevangTandel. All rights reserved.
//

import Foundation

//MARK: - API ERRORS
//Probable API error that could have encounter while fetching results
enum WebError: Error {
    case requestFailed
    case invalidData
    case jsonConversionFailed
    case responseUnsuccessful
    case jsonParsingFailure
    case invalidAPIKey
    
    var localizedDescription: String {
        switch self {
        case .requestFailed:
            return "Sorry, Request is Failed. Please try again"
        case .invalidData:
            return "Sorry,Invalid Data"
        case .responseUnsuccessful:
            return "Sorry, Unable to get result from server"
        case .jsonParsingFailure:
            return "Sorry, Failed to parse response, We are working on it"
        case .jsonConversionFailed:
            return "Sorry, Failed to convert response, we will fixing the issue"
        case .invalidAPIKey:
            return "The API is key is Invalid"
        }
    }
}

protocol APIResource {
    associatedtype Model
    var timeFrame: String { get }
    func makeModel(data:Data) -> Model
}


//http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=65cfa4884d78480ebd476c21a9df7106

extension APIResource {
    
    var url: URL {
        let baseUrl = URL_BASE
        let category = "svc/mostpopular/v2/mostviewed"
        let section = "/all-sections"
        let APIKEY = "api-key=" + API_KEY
        let url = baseUrl + category + section + "/" + timeFrame + ".json?" + APIKEY
        return URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!

    }
}

struct NewsResource: APIResource {
    
    var timeFrame = "7"
    func makeModel(data: Data) -> NewsResponse? {
        guard let news = try? JSONDecoder().decode(NewsResponse.self, from: data) else {
            return nil
        }
        return news
    }
}
