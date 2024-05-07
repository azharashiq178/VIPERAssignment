//
//  ListingView.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import Foundation

protocol ListingView: BaseView {
    
    var presenter: ListingPresenterImp? { get set }
    
    func reloadData()
    
    func showError(with message: String)
    
}
