//
//  NewsResponse.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on November 18, 2018

import Foundation

struct NewsResponse : Codable {

        let copyright : String?
        let numResults : Int?
        let results : [NewsResult]?
        let status : String?

        enum CodingKeys: String, CodingKey {
                case copyright = "copyright"
                case numResults = "num_results"
                case results = "results"
                case status = "status"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
                numResults = try values.decodeIfPresent(Int.self, forKey: .numResults)
                results = try values.decodeIfPresent([NewsResult].self, forKey: .results)
                status = try values.decodeIfPresent(String.self, forKey: .status)
        }

}
