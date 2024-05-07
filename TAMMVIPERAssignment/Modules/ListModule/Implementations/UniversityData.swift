//
//  UniversityData.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import Foundation
import RealmSwift

class UniversityData : Object, Codable {
    
    @objc dynamic var id: String = UUID().uuidString

    @objc dynamic var alphaTwoCode : String?
    @objc dynamic var country : String?
    dynamic var domains = List<String>()
    @objc dynamic var name : String?
    @objc dynamic var stateprovince : String?
    dynamic var webPages = List<String>()

    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    override init() {
        super.init()
        id = ""
        alphaTwoCode = nil
        country = nil
        domains = List<String>()
        name = nil
        stateprovince = nil
        webPages = List<String>()
    }
    

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case alphaTwoCode = "alpha_two_code"
        case country = "country"
        case domains = "domains"
        case name = "name"
        case stateprovince = "state-province"
        case webPages = "web_pages"
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        alphaTwoCode = try values.decodeIfPresent(String.self, forKey: .alphaTwoCode)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        if let val = try values.decodeIfPresent([String].self, forKey: .domains) {
            domains.append(objectsIn: val)
        }
        name = try values.decodeIfPresent(String.self, forKey: .name)
        stateprovince = try values.decodeIfPresent(String.self, forKey: .stateprovince)
        if let webPagesList = try values.decodeIfPresent([String].self, forKey: .webPages) {
            webPages.append(objectsIn: webPagesList)
        }
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.alphaTwoCode, forKey: .alphaTwoCode)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.domains, forKey: .domains)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.stateprovince, forKey: .stateprovince)
        try container.encodeIfPresent(self.webPages, forKey: .webPages)
    }
    
    override class func ignoredProperties() -> [String] {
        return ["domains", "web_pages"]
    }
}
