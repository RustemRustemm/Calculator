//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Rustam Shakirzianov on 11.05.2025.
//

import UIKit

class CalculatorViewController: UIViewController {

    private let viewModel: CalculatorViewModel
        private let displayLabel = UILabel()
        private let buttonsStackView = UIStackView()
        
        init(viewModel: CalculatorViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            setupConstraints()
        }
    
    private func setupUI() {
            view.backgroundColor = .black
            
            // Display Label
            displayLabel.text = viewModel.displayText
            displayLabel.textColor = .white
            displayLabel.font = UIFont.systemFont(ofSize: 72, weight: .light)
            displayLabel.textAlignment = .right
            displayLabel.adjustsFontSizeToFitWidth = true
            displayLabel.minimumScaleFactor = 0.5
            displayLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(displayLabel)
            
            // Buttons Stack View
            buttonsStackView.axis = .vertical
            buttonsStackView.distribution = .fillEqually
            buttonsStackView.spacing = 16
            buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(buttonsStackView)
            
            createButtonRows()
        }
    
    private func setupConstraints() {
            NSLayoutConstraint.activate([
                displayLabel.bottomAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: -20),
                displayLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                displayLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                
                buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
                buttonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                buttonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                buttonsStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6)
            ])
        }
    
    private func createButtonRows() {
        let buttonRows: [[CalculatorButtonType]] = [
            [.clear, .plusMinus, .percentage, .operation(.divide)],
            [.number(7), .number(8), .number(9), .operation(.multiply)],
            [.number(4), .number(5), .number(6), .operation(.subtract)],
            [.number(1), .number(2), .number(3), .operation(.add)],
            [.number(0), .number(0), .equals]
        ]
        
        for row in buttonRows {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = 16
            
            for buttonType in row {
                let button = CalculatorButton(type: buttonType)
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                rowStackView.addArrangedSubview(button)
                
                if case .number(0) = buttonType, row.count == 3 {
                    button.setContentHuggingPriority(.defaultLow, for: .horizontal)
                    let spacer = UIView()
                    spacer.setContentHuggingPriority(.defaultHigh, for: .horizontal)
                    rowStackView.insertArrangedSubview(spacer, at: 1)
                }
            }
            
            buttonsStackView.addArrangedSubview(rowStackView)
        }
    }
    
    @objc private func buttonTapped(_ sender: CalculatorButton) {
        viewModel.performAction(for: sender.type)
        displayLabel.text = viewModel.displayText
    }
}
