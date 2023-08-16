//
//  ViewController.swift
//  calculator
//
//  Created by Sean Davie on 7/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    var input = CalcInput()
    
    let label = UILabel()
    
    let testButtons = [
        CalculatorButton(buttonColor: .gray, label: "AC", type: BtnType.clear),
        CalculatorButton(buttonColor: .gray, label: "+/-", type: BtnType.flip),
        CalculatorButton(buttonColor: .gray, label: "%", type: BtnType.perc),
        CalculatorButton(buttonColor: .orange, label: "/", type: BtnType.divide),
        CalculatorButton(buttonColor: .darkGray, label: "7", type: BtnType.number),
        CalculatorButton(buttonColor: .darkGray, label: "8", type: BtnType.number),
        CalculatorButton(buttonColor: .darkGray, label: "9", type: BtnType.number),
        CalculatorButton(buttonColor: .orange, label: "x", type: BtnType.multiply),
        CalculatorButton(buttonColor: .darkGray, label: "4", type: BtnType.number),
        CalculatorButton(buttonColor: .darkGray, label: "5", type: BtnType.number),
        CalculatorButton(buttonColor: .darkGray, label: "6", type: BtnType.number),
        CalculatorButton(buttonColor: .orange, label: "-", type: BtnType.subtract),
        CalculatorButton(buttonColor: .darkGray, label: "1", type: BtnType.number),
        CalculatorButton(buttonColor: .darkGray, label: "2", type: BtnType.number),
        CalculatorButton(buttonColor: .darkGray, label: "3", type: BtnType.number),
        CalculatorButton(buttonColor: .orange, label: "+", type: BtnType.add),
        CalculatorButton(buttonColor: .darkGray, label: "0", type: BtnType.number),
        CalculatorButton(buttonColor: .orange, label: "=", type: BtnType.equal),
    ]
    
    let rowView = UIStackView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupView()
    }
    
    func setupView() {
        let numCols = 4
        let numRows = 5
        for i in 0..<numRows {
            let colView = UIStackView()
            let startIndex = i * numCols
            var endIndex = startIndex + numCols
            
            if endIndex > testButtons.count {
                endIndex = testButtons.count
            }
            
            for j in startIndex..<endIndex {
                view.addSubview(testButtons[j])
                colView.addArrangedSubview(testButtons[j])
                testButtons[j].addTarget(self, action: #selector(btnAction), for: .touchUpInside)
                setupColView(colView)
            }
            
            rowView.addArrangedSubview(colView)
        }
                
        rowView.axis = .vertical
        rowView.alignment = .center
        rowView.distribution = .equalCentering
        rowView.spacing = 15
        view.addSubview(rowView)
        
        setupLabel()
            
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
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.bottomAnchor.constraint(equalTo: rowView.topAnchor, constant: -25).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
    }
    
    func setupLabel() {
        label.font = UIFont.systemFont(ofSize: 45)
        label.text = "0"
        label.textColor = .white
        view.addSubview(label)
    }
    
    @objc func btnAction(_ button: CalculatorButton) {
        
        let currentNum : CalcNumber = input.output
        
        if button.type == BtnType.number && currentNum.stringNum.count == 1 && currentNum.decimalNum != 0 {
            testButtons[0].setTitle("C", for: .normal)
        } else if button.type == BtnType.clear {
            button.setTitle("A/C", for: .normal)
        }
        
        let calcNumberGenerator = calcCmds[button.type!]
        input = calcNumberGenerator?(input, button) ?? input
        
        label.text = input.output.stringNum
        
    }


}

