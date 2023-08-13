//
//  ViewController.swift
//  calculator
//
//  Created by Sean Davie on 7/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    let testButtons = [
        CalculatorButton(buttonColor: .gray, label: "AC"),
        CalculatorButton(buttonColor: .gray, label: "+/-"),
        CalculatorButton(buttonColor: .gray, label: "%"),
        CalculatorButton(buttonColor: .orange, label: "/"),
        CalculatorButton(buttonColor: .darkGray, label: "7"),
        CalculatorButton(buttonColor: .darkGray, label: "8"),
        CalculatorButton(buttonColor: .darkGray, label: "9"),
        CalculatorButton(buttonColor: .orange, label: "x"),
        CalculatorButton(buttonColor: .darkGray, label: "4"),
        CalculatorButton(buttonColor: .darkGray, label: "5"),
        CalculatorButton(buttonColor: .darkGray, label: "6"),
        CalculatorButton(buttonColor: .orange, label: "-"),
        CalculatorButton(buttonColor: .darkGray, label: "1"),
        CalculatorButton(buttonColor: .darkGray, label: "2"),
        CalculatorButton(buttonColor: .darkGray, label: "3"),
        CalculatorButton(buttonColor: .orange, label: "+"),
    ]
    
    let rowView = UIStackView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupView()
    }
    
    func setupView() {
        let numCols = 4
        let numRows = 4
        for i in 0..<numRows {
            let colView = UIStackView()
            let startIndex = i * numCols
            let endIndex = startIndex + numCols
            
            for j in startIndex..<endIndex {
                view.addSubview(testButtons[j])
                colView.addArrangedSubview(testButtons[j])
                setupColView(colView)
            }
            
            rowView.addArrangedSubview(colView)
        }
                
        rowView.axis = .vertical
        rowView.alignment = .center
        rowView.distribution = .equalCentering
        rowView.spacing = 15
        view.addSubview(rowView)
        
        
        addConstraints()
    }
    
    func setupColView(_ colView: UIStackView) {
        colView.translatesAutoresizingMaskIntoConstraints = false
        
        colView.axis = .horizontal
        colView.alignment = .center
        colView.distribution = .equalCentering
        colView.spacing = 15
        view.addSubview(colView)
    }
    
    func addConstraints() {
        rowView.translatesAutoresizingMaskIntoConstraints = false
        rowView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        rowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }


}

