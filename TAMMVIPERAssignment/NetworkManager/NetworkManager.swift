//
//  NetworkManager.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import Foundation
import Alamofire

typealias APIResultType = (APIResult<Data,Error>) -> Void

protocol Requestable {
    static var baseURL: String { get }
    func request(api: API, result: @escaping APIResultType) -> DataRequest?
}

extension Requestable {
    func request(api: API, result: @escaping APIResultType) -> DataRequest? {
        let request = AF.request(api.endPoint.urlString, method: api.method, parameters: api.parameters, encoding: api.encoding, headers: api.authorizedUserHeaders())
        request.responseData { response in
            switch response.result {
            case .success(let data):
                result(.success(data))
                break
            case .failure(let error):
                result(.failure(error))
            }
        }
        request.responseString { response in
            print("❤️💚❤️")
            print("URL:")
            print(api.endPoint.urlString)
            print("Params:")
            print(api.parameters ?? "No Parameters")
            print("Response:")
            print(response)
            print("❤️💚❤️")
        }
        return request
    }
}

class NetworkManager: Requestable {
    
    static var baseURL = "http://universities.hipolabs.com"
    static var `default` = NetworkManager()
}
