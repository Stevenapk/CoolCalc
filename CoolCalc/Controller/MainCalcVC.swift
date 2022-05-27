//
//  ViewController.swift
//  CoolCalc
//
//  Created by Steven Sullivan on 5/22/22.
//

import UIKit

class MainCalcVC: UIViewController {

    @IBOutlet weak var calculatorInput: UILabel!
    @IBOutlet weak var calculatorOutput: UILabel!
    
    var userInput = ""
    var stopEarly = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clear()
    }
    
    func clear() {
        userInput = ""
        calculatorInput.text = ""
        calculatorOutput.text = ""
    }
    
    func takeInput(val: String) {
        userInput = userInput + val
        calculatorInput.text = userInput
    }

    @IBAction func clear(_ sender: Any) {
        clear()
    }
    
    @IBAction func percent(_ sender: Any) {
        takeInput(val: "%")
    }
   
    @IBAction func back(_ sender: Any) {
        if !userInput.isEmpty {
            userInput.removeLast()
            calculatorInput.text = userInput
        }
    }
    
    @IBAction func divide(_ sender: Any) {
        takeInput(val: "/")
    }
    
    @IBAction func multiply(_ sender: Any) {
        takeInput(val: "*")
    }
    
    @IBAction func subtract(_ sender: Any) {
        takeInput(val: "-")
    }
    
    @IBAction func add(_ sender: Any) {
        takeInput(val: "+")
    }
    
    @IBAction func equals(_ sender: Any) {

        guard userInput != "" else {
            return }
        checkForErrors()
        checkForAdjascentError()
        guard stopEarly == false else {
            return }
        
        let inputWithPercent = userInput.replacingOccurrences(of: "%", with: "*.01")
            userInput = inputWithPercent
        if !userInput.contains(".") {
            takeInput(val: ".00")
        }
        let calculate = NSExpression(format: userInput)
        let output = calculate.expressionValue(with: nil, context: nil) as! Double
        let outputAsString = String(output)
        calculatorOutput.text = outputAsString
        }
    
    func checkForErrors() {
        let symbolsForBeginningCheck = ["+", "/", "*", "%"]
        let symbolsForEndCheck = ["+", "/", "*", "-", "."]
        let arrOfErrors = ["---", "***", "*--"]
        let userInputArr = Array(userInput)
        let firstChar = String(userInputArr[0])
        let lastChar = String(userInputArr[userInputArr.count - 1])
        if userInput.contains("..") {
            prepForStopEarly()
        }
        else if symbolsForBeginningCheck.contains(where: firstChar.contains) {
            prepForStopEarly()
        } else if symbolsForEndCheck.contains(where: lastChar.contains) {
            prepForStopEarly()
        } else if userInput.contains("/0") && !userInput.contains("/0.") {
            prepForStopEarly()
        } else if arrOfErrors.contains(where: userInput.contains) {
            prepForStopEarly()
        } else { stopEarly = false
        }

    }
    
    func checkForAdjascentError() {
    let symbols = ["+", "/", "*", "%"]
    let symbolsSetTwo = ["+", "/", "%"]
    let adjascentSymbolNoNos = ["+", "/"]
    let userInputArr = Array(userInput)
    var i = 1
        if stopEarly == false {
    while i < userInputArr.count-1 {
        if adjascentSymbolNoNos.contains(where: String(userInputArr[i]).contains) &&
            adjascentSymbolNoNos.contains(where: String(userInputArr[i+1]).contains) || String(userInputArr[i]).contains("-") && symbols.contains(where: String(userInputArr[i+1]).contains) || String(userInputArr[i]).contains("*") && symbolsSetTwo.contains(where: String(userInputArr[i+1]).contains)
        { prepForStopEarly() }
        i+=1
        }
        }
    }
    
    func prepForStopEarly () {
        clear()
        stopEarly = true
    }
    
    @IBAction func decimal(_ sender: Any) {
        takeInput(val: ".")
    }
    
    @IBAction func zero(_ sender: Any) {
        takeInput(val: "0")
    }
    
    @IBAction func one(_ sender: Any) {
        takeInput(val: "1")
    }
    
    @IBAction func two(_ sender: Any) {
        takeInput(val: "2")
    }
    @IBAction func three(_ sender: Any) {
        takeInput(val: "3")
    }
  
    @IBAction func four(_ sender: Any) {
        takeInput(val: "4")
    }
    
    @IBAction func five(_ sender: Any) {
        takeInput(val: "5")
    }
    
    @IBAction func six(_ sender: Any) {
        takeInput(val: "6")
    }
    
    @IBAction func seven(_ sender: Any) {
        takeInput(val: "7")
    }
    
    @IBAction func eight(_ sender: Any) {
        takeInput(val: "8")
    }
    
    @IBAction func nine(_ sender: Any) {
        takeInput(val: "9")
    }
    
}

