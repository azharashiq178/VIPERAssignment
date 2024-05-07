//
//  BaseView.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import Foundation
import UIKit

protocol BaseView: class {
    func getNavigationController() -> UINavigationController?
    func configureNavigationBar()
}

extension BaseView {
    func getNavigationController() -> UINavigationController? {
        guard let viewController = self as? UIViewController else {
            return nil
        }
        return viewController.navigationController
    }
    func configureNavigationBar() {
        if let navController = getNavigationController() {
            let barAppearance = UINavigationBarAppearance()
            barAppearance.configureWithDefaultBackground()
            navController.navigationBar.isTranslucent = true
            navController.navigationBar.scrollEdgeAppearance = barAppearance
            navController.navigationBar.standardAppearance = barAppearance
        }
        
    }
}
