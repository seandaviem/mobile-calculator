//
//  ViewController.swift
//  calculator
//
//  Created by Sean Davie on 7/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    var testButton = CalculatorButton(buttonColor: .orange, label: "1")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.addSubview(testButton)
        addConstraints()
    }
    
    func addConstraints() {
        testButton.translatesAutoresizingMaskIntoConstraints = false
        testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        testButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25, constant: -30).isActive = true
        testButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25, constant: -30).isActive = true
    }


}

