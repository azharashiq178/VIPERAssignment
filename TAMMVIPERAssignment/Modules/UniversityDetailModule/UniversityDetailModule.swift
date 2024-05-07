//
//  UniversityDetailModule.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import Foundation
import UIKit

class UniversityDetailModule {
    
    
    func buildDefault(with universityDetails: UniversityData) -> UIViewController? {
        
        let view = Story.main.loadViewController(type: UniversityDetailViewController.self)
        //
        let interactor = UniversityDetailInteractorImp()
        let presenter = UniversityDetailPresenterImp()
        let router = UniversityDetailRouterImp()
        //
        view.presenter = presenter
        //
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        router.baseView = view
        interactor.presenter = presenter
        presenter.setUniversityData(with: universityDetails)
        
        return view
    }
}
