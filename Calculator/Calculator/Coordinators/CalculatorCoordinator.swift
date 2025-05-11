//
//  CalculatorCoordinator.swift
//  Calculator
//
//  Created by Rustam Shakirzianov on 11.05.2025.
//

import UIKit

protocol Coordinator {
    func start()
}

class CalculatorCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let calculatorViewModel = CalculatorViewModel()
        let calculatorViewController = CalculatorViewController(viewModel: calculatorViewModel)
        navigationController.pushViewController(calculatorViewController, animated: true)
    }
}
