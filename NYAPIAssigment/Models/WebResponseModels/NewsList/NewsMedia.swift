//
//  NewsMedia.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on November 18, 2018

import Foundation

struct NewsMedia : Codable {

        let approvedForSyndication : Int?
        let caption : String?
        let copyright : String?
        let mediaMetadata : [NewsMediaMetadata]?
        let subtype : String?
        let type : String?

        enum CodingKeys: String, CodingKey {
                case approvedForSyndication = "approved_for_syndication"
                case caption = "caption"
                case copyright = "copyright"
                case mediaMetadata = "media-metadata"
                case subtype = "subtype"
                case type = "type"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                approvedForSyndication = try values.decodeIfPresent(Int.self, forKey: .approvedForSyndication)
                caption = try values.decodeIfPresent(String.self, forKey: .caption)
                copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
                mediaMetadata = try values.decodeIfPresent([NewsMediaMetadata].self, forKey: .mediaMetadata)
                subtype = try values.decodeIfPresent(String.self, forKey: .subtype)
                type = try values.decodeIfPresent(String.self, forKey: .type)
        }

}
