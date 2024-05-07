//
//  ListingPresenterImp.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import Foundation

class ListingPresenterImp : ListingPresenter {
    
    var view: ListingViewController?
    
    var interactor: ListingInteractorImp?
    
    var router: ListingRouterImp?
    
    var universitiesList: [UniversityData] = [UniversityData]()
    
    
    func updateUniversities(newList: [UniversityData]) {
        self.universitiesList = newList
        self.view?.reloadData()
    }
    
    
    func numberOfRows(in section: Int) -> Int {
        return universitiesList.count
    }
    
}
