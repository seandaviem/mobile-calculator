//
//  CalculatorButton.swift
//  calculator
//
//  Created by Sean Davie on 7/14/23.
//

import UIKit

class CalculatorButton: UIButton {
    
    var buttonColor: UIColor?
    var label: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    init(buttonColor: UIColor, label: String) {
        self.buttonColor = buttonColor
        self.label = label
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

}
