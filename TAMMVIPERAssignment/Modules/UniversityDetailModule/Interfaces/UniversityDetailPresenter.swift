//
//  UniversityDetailPresenter.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import Foundation

protocol UniversityDetailPresenter {
    
    var view: UniversityDetailViewController? { get set }
    var interactor: UniversityDetailInteractorImp? { get set }
    var router: UniversityDetailRouterImp? { get set }
    var universityData: UniversityData? { get set}
    
}
