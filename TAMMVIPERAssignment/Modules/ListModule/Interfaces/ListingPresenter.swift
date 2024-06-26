//
//  ListingPresenter.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import Foundation

protocol ListingPresenter {
    
    var view: ListingViewController? { get set }
    var interactor: ListingInteractorImp? { get set }
    var router: ListingRouterImp? { get set }
    
    func updateUniversities(newList: [UniversityData])
    func numberOfRows(in section: Int) -> Int
    func fetchUniversities()
    func moveToDetails(from index: Int)
}
