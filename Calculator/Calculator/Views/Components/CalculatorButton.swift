//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Rustam Shakirzianov on 11.05.2025.
//

import UIKit

class CalculatorButton: UIButton {

    let type: CalculatorButtonType
        
        init(type: CalculatorButtonType) {
            self.type = type
            super.init(frame: .zero)
            setupButton()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupButton() {
            setTitle(titleForButtonType(type), for: .normal)
            titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .medium)
            layer.cornerRadius = 40
            clipsToBounds = true
            backgroundColor = backgroundColorForButtonType(type)
            setTitleColor(titleColorForButtonType(type), for: .normal)
            translatesAutoresizingMaskIntoConstraints = false
            heightAnchor.constraint(equalTo: widthAnchor).isActive = true
        }
        
        private func titleForButtonType(_ type: CalculatorButtonType) -> String {
            switch type {
            case .number(let num): return "\(num)"
            case .operation(let op):
                switch op {
                case .add: return "+"
                case .subtract: return "-"
                case .multiply: return "×"
                case .divide: return "÷"
                }
            case .clear: return "C"
            case .equals: return "="
            case .plusMinus: return "+/-"
            case .percentage: return "%"
            }
        }
    
    private func backgroundColorForButtonType(_ type: CalculatorButtonType) -> UIColor {
            switch type {
            case .number, .plusMinus, .percentage: return .darkGray
            case .operation: return .orange
            case .clear: return .lightGray
            case .equals: return .orange
            }
        }
        
        private func titleColorForButtonType(_ type: CalculatorButtonType) -> UIColor {
            switch type {
            case .clear: return .black
            default: return .white
            }
        }
    }

