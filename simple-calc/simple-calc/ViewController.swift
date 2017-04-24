//
//  ViewController.swift
//  simple-calc
//
//  Created by Austin D. Hutchinson on 4/17/17.
//  Copyright © 2017 Austin D. Hutchinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    weak var calculationsBar: UILabel!
    let operands = ["+", "-", "*", "/", "%", "COUNT", "AVG", "FACT"]
    var history = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func digitInput(_ sender: UIButton) {
        let value = sender.currentTitle!
        if (calculationsBar.text?.contains("e"))! {
            calculationsBar.text = ""
        }
        if (operands.contains(value)) {
            calculationsBar.text! += " " + value + " "
        } else {
            calculationsBar.text! += value
        }
        
    }
    @IBAction func deleteText(_ sender: UIButton) {
        calculationsBar.text = ""
    }

    @IBAction func enterButton(_ sender: UIButton) {
        let operation = calculationsBar.text
        var input = operation?.components(separatedBy: " ")
        if (operation?.contains("e"))! {
            calculationsBar.text = "Please put in an operation to perform"
            return
        }
        let response = input?[0]
        if input!.contains("COUNT"){
            
            calculationsBar.text = ("Result: \((input!.count / 2) + 1)")
            
        } else if input!.contains("AVG") {
            var sum = 0;
            var numNums = 0;
            for i in 0...input!.count - 1{
                if (Int((input?[i])!) != nil){
                    sum += Int(input![i])!
                    numNums += 1
                }
            }
            calculationsBar.text = ("Result: \(Double(sum) / Double(numNums))")
            
        } else if input!.contains("FACT") {
            var factorial = 1;
            for i in 1...Int(input![0])!{
                factorial *= i
            }
            calculationsBar.text = ("Result: \(factorial)")
            
        } else {
            let response2 = (input?[1])!
            let response3 = Double( (input?[2])! )
            
            if response2 == "+"  {
                let result = Double(response!)! + response3!
                calculationsBar.text = ("Result: \(result)")
            } else if response2 == "-" {
                let result = Double(response!)! - response3!
                calculationsBar.text = ("Result: \(result)")
            } else if response2 == "*" {
                let result = Double(response!)! * response3!
                calculationsBar.text = ("Result: \(result)")
            } else if response2 == "/" {
                let result = Double(response!)! / response3!
                calculationsBar.text = ("Result: \(result)")
            } else if response2 == "%" {
                let result = Double(response!)!.truncatingRemainder(dividingBy: response3!)
                calculationsBar.text = ("Result: \(result)")
            } else {
                calculationsBar.text = ("That is not a supported operand. Please try again with these options (+, -, *, /, %, count, avg, fact)")
            }
    
        }
    }
    
    
}
