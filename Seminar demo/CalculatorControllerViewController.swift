//
//  CalculatorControllerViewController.swift
//  Seminar demo
//
//  Created by Alexander Bliss on 10/9/18.
//  Copyright © 2018 Alexander Bliss. All rights reserved.
//

import UIKit

class CalculatorControllerViewController: UIViewController {
    
    class Equation {
        var num0 = ""
        var num1 = ""
        var operation = ""
        var answer: Double? = nil
    }

    var equation = Equation()
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Equals(_ sender: UIButton) {
        print("Equals Touch")
        if equation.operation == "-" {
            equation.answer = Double( equation.num0)! - Double( equation.num1 )!
        } else if equation.operation == "*" {
            equation.answer = Double( equation.num0)! * Double( equation.num1 )!
        } else if equation.operation == "/" {
            equation.answer = Double( equation.num0)! / Double( equation.num1 )!
        } else {
            equation.answer = Double( equation.num0)! + Double( equation.num1 )!
        }
        outputLabel.text = String( equation.answer! )
        equation.num0 = ""
        equation.num1 = ""
        equation.operation = ""
    }
    @IBAction func OperationTouch(_ sender: UIButton) {
        let operation = sender.titleLabel!.text!
        outputLabel.text = ( "Operation Touch:" + operation)
        equation.operation = operation
    }
    @IBAction func NumberTouch(_ sender: UIButton) {
        let number = sender.titleLabel!.text!
        print("Number Touch: " + number)
        
        if equation.operation == "" {
            equation.num0 += number
        } else {
            equation.num1 += number
        }
        updateOutput()
    }
    func updateOutput(){
        outputLabel.text = equation.num0 + equation.operation + equation.num1
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
