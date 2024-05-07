//
//  ListingInteractorImp.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import Foundation
import Alamofire
import RealmSwift

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
                    weakSelf.saveUniversityDataSafe(universities: list)
                }
                else {
                    weakSelf.updateUniversitiesFromDB()
                }
                break
            case .failure(let error):
                weakSelf.updateUniversitiesFromDB()
                break
            }
            
        }
    }
    
    
    private func saveUniversityDataSafe(universities: [UniversityData]) {
        do {
            let realm = try Realm()
            try realm.write {
                for university in universities {
                    realm.add(university, update: .modified)
                }
            }
        } catch let error as NSError {
            // Handle error by logging or presenting user-facing messages
            print("An error occurred while saving universities: \(error.localizedDescription)")
        }
    }
    
    private func fetchUniversities() -> [UniversityData] {
        let realm = try! Realm()
        return Array(realm.objects(UniversityData.self))
    }
    
    
    private func updateUniversitiesFromDB() {
        let list = fetchUniversities()
        presenter?.updateUniversities(newList: list)
        
    }
    
}
