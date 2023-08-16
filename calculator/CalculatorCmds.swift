//
//  CalculatorCmds.swift
//  calculator
//
//  Created by Sean Davie on 8/15/23.
//

import Foundation

let calcCmds : [BtnType : (CalcInput, CalculatorButton) -> CalcInput] = [
    .number: { (input, button) in
        var output = input
        let newNum = button.label ?? ""
        
        if input.output.stringNum.count < 11 {
            if input.isRh {
                output.rh = button.generateNum(current: input.rh.stringNum)
            } else {
                output.lh = button.generateNum(current: input.lh.stringNum)
            }
        }
        
        return output
    },
    .clear: { (input, button) in
        return CalcInput()
    }
]

// - When +-*/ selected, store current
