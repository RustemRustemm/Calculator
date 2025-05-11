//
//  Calculator.swift
//  Calculator
//
//  Created by Rustam Shakirzianov on 11.05.2025.
//

import Foundation

import Foundation

struct Calculator {
    private var currentNumber: Double = 0
    private var previousNumber: Double?
    private var operation: Operation?
    private var isPerformingOperation = false
    
    enum Operation {
        case add, subtract, multiply, divide
    }
    
    mutating func setOperand(_ operand: Double) {
        currentNumber = operand
    }
    
    mutating func performOperation(_ operation: Operation) {
        if let previous = previousNumber {
            switch self.operation {
            case .add:
                currentNumber = previous + currentNumber
            case .subtract:
                currentNumber = previous - currentNumber
            case .multiply:
                currentNumber = previous * currentNumber
            case .divide:
                currentNumber = previous / currentNumber
            case nil:
                break
            }
        }
        previousNumber = currentNumber
        self.operation = operation
        isPerformingOperation = true
    }
    
    mutating func clear() {
        currentNumber = 0
        previousNumber = nil
        operation = nil
        isPerformingOperation = false
    }
    
    mutating func calculate() -> Double {
        if let previous = previousNumber, let operation = operation {
            switch operation {
            case .add:
                currentNumber = previous + currentNumber
            case .subtract:
                currentNumber = previous - currentNumber
            case .multiply:
                currentNumber = previous * currentNumber
            case .divide:
                currentNumber = previous / currentNumber
            }
            previousNumber = nil
            self.operation = nil
        }
        isPerformingOperation = false
        return currentNumber
    }
    
    func getCurrentNumber() -> Double {
        return currentNumber
    }
    
    mutating func toggleSign() {
        currentNumber *= -1
    }
    
    mutating func percentage() {
        currentNumber /= 100
    }
}
