//
//  EndPoint.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import Foundation

enum Endpoint: URLDirectable {
    
    case searchUniversities(String)
    
    var urlString: String {
        var url = ""
        switch self {
        case .searchUniversities(let countryName):
            url = "search?country=/\(countryName)"
            break
        }
        return NetworkManager.baseURL + "/" + url
    }
}
