//
//  NewsResult.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on November 18, 2018

import Foundation

struct NewsResult : Codable {

        let abstractField : String?
        let adxKeywords : String?
        let assetId : Int?
        let byline : String?
        let column : String?
        let id : Int?
        let media : [NewsMedia]?
        let publishedDate : String?
        let section : String?
        let source : String?
        let title : String?
        let type : String?
        let url : String?
        let views : Int?

        enum CodingKeys: String, CodingKey {
                case abstractField = "abstract"
                case adxKeywords = "adx_keywords"
                case assetId = "asset_id"
                case byline = "byline"
                case column = "column"
                case id = "id"
                case media = "media"
                case publishedDate = "published_date"
                case section = "section"
                case source = "source"
                case title = "title"
                case type = "type"
                case url = "url"
                case views = "views"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                abstractField = try values.decodeIfPresent(String.self, forKey: .abstractField)
                adxKeywords = try values.decodeIfPresent(String.self, forKey: .adxKeywords)
                assetId = try values.decodeIfPresent(Int.self, forKey: .assetId)
                byline = try values.decodeIfPresent(String.self, forKey: .byline)
                column = try values.decodeIfPresent(String.self, forKey: .column)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                media = try values.decodeIfPresent([NewsMedia].self, forKey: .media)
                publishedDate = try values.decodeIfPresent(String.self, forKey: .publishedDate)
                section = try values.decodeIfPresent(String.self, forKey: .section)
                source = try values.decodeIfPresent(String.self, forKey: .source)
                title = try values.decodeIfPresent(String.self, forKey: .title)
                type = try values.decodeIfPresent(String.self, forKey: .type)
                url = try values.decodeIfPresent(String.self, forKey: .url)
                views = try values.decodeIfPresent(Int.self, forKey: .views)
        }

}
