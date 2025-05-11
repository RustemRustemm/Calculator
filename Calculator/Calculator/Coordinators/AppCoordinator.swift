//
//  AppCoordinator.swift
//  Calculator
//
//  Created by Rustam Shakirzianov on 11.05.2025.
//

import UIKit

class AppCoordinator: Coordinator {
    private let window: UIWindow
    private var calculatorCoordinator: CalculatorCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        calculatorCoordinator = CalculatorCoordinator(navigationController: navigationController)
        calculatorCoordinator?.start()
    }
}
