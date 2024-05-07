//
//  ListModule.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import Foundation
import UIKit

class ListModule {
    
    
    func buildDefault() -> UIViewController? {
        
        let view = Story.main.loadViewController(type: ListingViewController.self)
        //
        let interactor = ListingInteractorImp(service: NetworkManager.default)
        let presenter = ListingPresenterImp()
        let router = ListingRouterImp()
        //
        view.presenter = presenter
        //
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        router.baseView = view
        interactor.presenter = presenter
        
        
        return UINavigationController(rootViewController: view)
    }
}
