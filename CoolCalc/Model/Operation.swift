//
//  Operation.swift
//  CoolCalc
//
//  Created by Carlos Cardoso on 9/3/21.
//

import Foundation


class Operation {
    
    var number: Double?
    
    enum OperationType: String {
        case addition, substraction, multiplication, division
    }
    
    func addition(_ firstNumber: Double?, plus secondNumber: Double?) -> Double {
        if let numberOne = firstNumber, let numberTwo = secondNumber {
            return numberOne + numberTwo
        }
        return 0.0
    }
    
    func substraction(_ firstNumber: Double?, minus secondNumber: Double?) -> Double {
        if let numberOne = firstNumber, let numberTwo = secondNumber {
            return numberOne - numberTwo
        }
        return 0.0
    }
    
    func multiplication(_ firstNumber: Double?, times secondNumber: Double?) -> Double {
        if let numberOne = firstNumber, let numberTwo = secondNumber {
            return numberOne * numberTwo
        }
        return 0.0
    }
    
    func division(_ firstNumber: Double?, dividedBy secondNumber: Double?) -> Double {
        if let numberOne = firstNumber, let numberTwo = secondNumber {
            return numberOne / numberTwo
        }
        return 0.0
    }
}
