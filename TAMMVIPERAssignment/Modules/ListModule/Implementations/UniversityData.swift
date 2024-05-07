//
//  UniversityData.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import Foundation

struct UniversityData : Codable {

    let alphaTwoCode : String?
    let country : String?
    let domains : [String]?
    let name : String?
    let stateprovince : String?
    let webPages : [String]?


    enum CodingKeys: String, CodingKey {
        case alphaTwoCode = "alpha_two_code"
        case country = "country"
        case domains = "domains"
        case name = "name"
        case stateprovince = "state-province"
        case webPages = "web_pages"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        alphaTwoCode = try values.decodeIfPresent(String.self, forKey: .alphaTwoCode)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        domains = try values.decodeIfPresent([String].self, forKey: .domains)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        stateprovince = try values.decodeIfPresent(String.self, forKey: .stateprovince)
        webPages = try values.decodeIfPresent([String].self, forKey: .webPages)
    }
}
