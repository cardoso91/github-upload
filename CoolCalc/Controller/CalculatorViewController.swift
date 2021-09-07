//
//  ViewController.swift
//  CoolCalc
//
//  Created by Carlos Cardoso on 9/3/21.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var resultLbl: UILabel!
    var result = String()
    var operation = Operation()
    var operationType = Operation.OperationType.addition
    var firstNumber: Double?
    var secondNumber: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getNumber(_ number: String?) -> Double? {
        if let validatedNumber = number {
            let numberToDouble = Double(validatedNumber)
            if let number = numberToDouble {
                result = ""
                return number
            }
            return nil
        }
        return nil
    }
    
    func numberNilCheck(_ number: Double?) {
        if firstNumber == nil {
            firstNumber = number
        } else if secondNumber == nil {
            secondNumber = number
        }
    }
    
    func updateResultLabel(_ value: String) {
        result += value
        resultLbl.text = result
    }
    
    func clearField() {
        resultLbl.text = "0"
        result = ""
        
    }
    
    func resetNumbervalue(){
        firstNumber = nil
        secondNumber = nil
    }

    @IBAction func printOneOnPressed(_ sender: Any) {
        updateResultLabel("1")
    }
    @IBAction func printTwoOnPressed(_ sender: Any) {
        updateResultLabel("2")
    }
    @IBAction func printThreeOnPressed(_ sender: Any) {
        updateResultLabel("3")
    }
    @IBAction func printFourOnPressed(_ sender: Any) {
        updateResultLabel("4")
    }
    @IBAction func printFiveOnPressed(_ sender: Any) {
        updateResultLabel("5")
    }
    @IBAction func printSixOnPressed(_ sender: Any) {
        updateResultLabel("6")
    }
    @IBAction func printSevenOnPressed(_ sender: Any) {
        updateResultLabel("7")
    }
    @IBAction func printEightOnPressed(_ sender: Any) {
        updateResultLabel("8")
    }
    @IBAction func printNineOnPressed(_ sender: Any) {
        updateResultLabel("9")
    }
    @IBAction func printPeriodOnPressed(_ sender: Any) {
        if let actualResultLbl = resultLbl.text {
            if actualResultLbl.contains("."){
            } else {
                updateResultLabel(".")
            }
        }
    }
    @IBAction func printZeroOnPressed(_ sender: Any) {
        updateResultLabel("0")
    }
    @IBAction func printDoubleZeroOnPressed(_ sender: Any) {
        updateResultLabel("00")
    }
    @IBAction func clearOnPressed(_ sender: Any) {
        clearField()
        resetNumbervalue()
    }
    @IBAction func plusMinusOnPressed(_ sender: Any) {
        var newResultLblValue = Double()
        
        if let resultLblCurrentValue = resultLbl.text {
            if let resultLblValueToDouble = Double(resultLblCurrentValue) {
                if resultLblValueToDouble == 0 {
                    
                } else if resultLblValueToDouble > 0 {
                    newResultLblValue = -resultLblValueToDouble
                    resultLbl.text = prepareForResultLabel(newResultLblValue)
                } else if resultLblValueToDouble < 0 {
                    newResultLblValue = abs(resultLblValueToDouble)
                    resultLbl.text = prepareForResultLabel(newResultLblValue)
                }
            }
        }
    }
    @IBAction func percentageOnPressed(_ sender: Any) {
        var percentage = Double()
        
        if let currentResultLbl = resultLbl.text {
            if let resultLblValue = Double(currentResultLbl) {
                if firstNumber != nil {
                    percentage = resultLblValue / 100
                    if let firstNumber = firstNumber {
                        secondNumber = firstNumber * percentage
                    }
                } else {
                percentage = resultLblValue / 100
                resultLbl.text = prepareForResultLabel(percentage)
                }
            }
        }
        
    }
    @IBAction func divisionOnPressed(_ sender: Any) {
        resetNumbervalue()
        operationType = Operation.OperationType.division
        let number = getNumber(resultLbl.text)
        numberNilCheck(number)
        
    }
    @IBAction func multiplicationOnPressed(_ sender: Any) {
        resetNumbervalue()
        operationType = Operation.OperationType.multiplication
        let number = getNumber(resultLbl.text)
        numberNilCheck(number)
    }
    @IBAction func substractionOnPressed(_ sender: Any) {
        resetNumbervalue()
        operationType = Operation.OperationType.substraction
        let number = getNumber(resultLbl.text)
        numberNilCheck(number)
    }
    @IBAction func additionOnPressed(_ sender: Any) {
        resetNumbervalue()
        operationType = Operation.OperationType.addition
        let number = getNumber(resultLbl.text)
        numberNilCheck(number)
    }
    @IBAction func equalsOnPressed(_ sender: Any) {
        let number = getNumber(resultLbl.text)
        numberNilCheck(number)
        
        switch operationType {
        case .addition:
            let addition = operation.addition(firstNumber, plus: secondNumber)
            resultLbl.text = prepareForResultLabel(addition)
            firstNumber = addition
        case .substraction:
            let substraction = operation.substraction(firstNumber, minus: secondNumber)
            resultLbl.text = prepareForResultLabel(substraction)
            firstNumber = substraction
        case .multiplication:
            let multiplication = operation.multiplication(firstNumber, times: secondNumber)
            resultLbl.text = prepareForResultLabel(multiplication)
            firstNumber = multiplication
        case .division:
            let division = operation.division(firstNumber, dividedBy: secondNumber)
            resultLbl.text = prepareForResultLabel(division)
            firstNumber = division
            
        }
    }
    
    func prepareForResultLabel(_ number: Double) -> String {
        if number.truncatingRemainder(dividingBy: 1) == 0 {
            let resultLblValue = number.rounded()
            //firstNumber = resultLblValue
            let resultLbl = String(resultLblValue).dropLast(2)
            return String(resultLbl)
        } else {
            let resultLblValue = number
            //firstNumber = resultLblValue
            return String(resultLblValue)
        }
    }
    
}

