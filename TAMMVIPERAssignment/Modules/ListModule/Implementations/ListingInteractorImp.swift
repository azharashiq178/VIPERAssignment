//
//  ListingInteractorImp.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import Foundation
import Alamofire

class ListingInteractorImp: ListingInteractor {
    var presenter: ListingPresenterImp?
    
    weak var service: NetworkManager?
    
    
    
    init(service: NetworkManager) {
        self.service = service
        getUniversities()
    }
    
    
    func getUniversities() {
        let api = API(method: .get, endPoint: Endpoint.searchUniversities("United Arab Emirates"), isAuthorized: false, parameters: nil, additionalHeaders: nil, encoding: URLEncoding.default)
        _ = NetworkManager.default.request(api: api) { [weak self] response in
            guard let weakSelf = self else { return }
            switch response {
            case .success(let result):
                print(result)
                
                if let list = try? JSONDecoder().decode([UniversityData].self, from: result) {
                    weakSelf.presenter?.updateUniversities(newList: list)
                }
                else {
                    
                }
                
                break
            case .failure(let error):
                print(error)
                break
            }
            
        }
    }
    
}
