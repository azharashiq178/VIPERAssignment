//
//  ListingInteractor.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import Foundation

protocol ListingInteractor{
    
    var presenter: ListingPresenterImp? { get set }
    
//    func getDetailsForCareActions(id : Int, completion: @escaping ((ZorgatiesEntity?) -> Void))
}
