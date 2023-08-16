//
//  CalculatorButton.swift
//  calculator
//
//  Created by Sean Davie on 7/14/23.
//

import UIKit

enum BtnType {
    case utility
    case number
    case clear
    case add
    case subtract
    case multiply
    case divide
    case flip
    case perc
    case equal
}

struct CalcNumber {
    var decimalNum: Double
    var stringNum: String
    
    init(dec: Double, string: String) {
        self.decimalNum = dec
        self.stringNum = string
    }
}

struct CalcInput {
    var lh = CalcNumber(dec: 0, string: "0")
    var rh = CalcNumber(dec: 0, string: "0")
    var total = CalcNumber(dec: 0, string: "0")
    var isRh = false
    var output: CalcNumber { return isRh ? rh : lh }
    var rule: BtnType?
}

class CalculatorButton: UIButton {
    
    var buttonColor: UIColor?
    var label: String?
    var type: BtnType?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    init(buttonColor: UIColor, label: String, type: BtnType) {
        self.buttonColor = buttonColor
        self.label = label
        self.type = type
        super.init(frame: .zero)

        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = (frame.height) / 2
//        self.frame.size = CGSize(width: 75, height: 75)

    }
    
    func setupButton() {
        backgroundColor = buttonColor
        clipsToBounds = true
        setTitle(label, for: .normal)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 75).isActive = true
        heightAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    func generateNum(current: String) -> CalcNumber {
        
        if current == "0" {
            let num = self.label ?? "0"
            return CalcNumber(dec: Double(num)!, string: num)
        }
        
        let newNumString = current + (self.label ?? "")
        let newNumDec = Double(newNumString.filter{$0 != ","}) ?? 0
        
        return CalcNumber(dec: newNumDec, string: newNumDec.withCommas())
    }

}
