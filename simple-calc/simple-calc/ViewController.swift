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
        calculationsBar.text! += value + " "
    }
    @IBAction func deleteText(_ sender: UIButton) {
        let str = calculationsBar.text
        print("yup")
        if str != nil {
            print("yup2")
            calculationsBar.text = str!.substring(to: str!.index(before: str!.endIndex))
            calculationsBar.text = str!.substring(to: str!.index(before: str!.endIndex))
        }
    }

    @IBAction func enterButton(_ sender: UIButton) {
        let operation = calculationsBar.text
        var intList = operation?.components(separatedBy: " ")
        let response = intList?[0]
        if response!.contains("count"){
            calculationsBar.text = ("Result: \(intList!.count - 1)")
            
        } else if response!.contains("avg") {
            _ = intList!.popLast()
            var sum = 0;
            for i in 0...intList!.count - 1{
                sum += Int(intList![i])!
            }
            calculationsBar.text = ("Result: \(Double(sum) / Double(intList!.count))")
            
        } else if response!.contains("fact") {
            var factorial = 1;
            for i in 1...Int(intList![0])!{
                factorial *= i
            }
            calculationsBar.text = ("Result: \(factorial)")
            
        } else {
            let response2 = (intList?[1])!
            let response3 = Double( (intList?[2])! )
            
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
