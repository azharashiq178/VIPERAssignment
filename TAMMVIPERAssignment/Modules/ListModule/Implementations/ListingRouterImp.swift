//
//  ListingRouterImp.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import Foundation

class ListingRouterImp: ListingRouter, RouterInterface {
    
    var baseView: BaseView?
    
    func moveToDetails(with selectedData: UniversityData) {
        
        let controller = Story.main.loadViewController(type: ViewController.self)
        
        baseView?.getNavigationController()?.pushViewController(controller, animated: true)
    }
    
}
