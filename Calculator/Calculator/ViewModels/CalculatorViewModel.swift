//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Rustam Shakirzianov on 11.05.2025.
//

import Foundation

class CalculatorViewModel {
    private var calculator = Calculator()
    var displayText: String = "0"
    
    func performAction(for buttonType: CalculatorButtonType) {
        switch buttonType {
        case .number(let number):
            appendNumber(number)
        case .operation(let operation):
            performOperation(operation)
        case .clear:
            calculator.clear()
            displayText = "0"
        case .equals:
            let result = calculator.calculate()
            displayText = formatResult(result)
        case .plusMinus:
            calculator.toggleSign()
            displayText = formatResult(calculator.getCurrentNumber())
        case .percentage:
            calculator.percentage()
            displayText = formatResult(calculator.getCurrentNumber())
        }
    }
    
    private func appendNumber(_ number: Int) {
        let currentDisplay = displayText == "0" ? "" : displayText
        displayText = currentDisplay + String(number)
        if let numberValue = Double(displayText) {
            calculator.setOperand(numberValue)
        }
    }
    
    private func performOperation(_ operation: Calculator.Operation) {
        calculator.performOperation(operation)
        displayText = "0"
    }
    
    private func formatResult(_ result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result)
        } else {
            return String(result)
        }
    }
}

enum CalculatorButtonType {
    case number(Int)
    case operation(Calculator.Operation)
    case clear
    case equals
    case plusMinus
    case percentage
}
