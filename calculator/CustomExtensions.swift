//
//  CustomExtensions.swift
//  calculator
//
//  Created by Sean Davie on 8/13/23.
//

import Foundation

extension Double {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
