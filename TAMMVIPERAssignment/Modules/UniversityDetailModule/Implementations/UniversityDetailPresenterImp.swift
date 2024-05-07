//
//  UniversityDetailPresenterImp.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import Foundation

class UniversityDetailPresenterImp : UniversityDetailPresenter {
    
    var view: UniversityDetailViewController?
    
    var interactor: UniversityDetailInteractorImp?
    
    var router: UniversityDetailRouterImp?
    
    var universityData: UniversityData?
    
    
    func setUniversityData(with item: UniversityData) {
        self.universityData = item
    }
    
}
