//
//  CalculatorViewController.swift
//  Calculator_V1
//
//  Created by Kittinun Chobtham on 16/5/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var Result_lable: UILabel!
    
    var numberOnscreen: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var isPerformingOperation = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Result_lable.text = ""
    }
    @IBAction func numberPressed(_ sender: Any) {
        
        let tag = (sender as! UIButton).tag
        
        if isPerformingOperation == true{
            isPerformingOperation = false
            Result_lable.text = String (tag - 1)
            numberOnscreen = Double (Result_lable.text!)!
            
        }else {
            let tag = (sender as! UIButton).tag
            Result_lable.text = Result_lable.text! + String(tag - 1)
            numberOnscreen = Double (Result_lable.text!)!

        }
        
    }
    
    @IBAction func operatorPressed(_ sender: Any) {
        
        let tag = (sender as! UIButton).tag
        
        if tag == 16 {
            Result_lable.text = ""
            previousNumber = 0
            numberOnscreen = 0
            operation = 0
            
            return
        }
        if tag == 11{
            isPerformingOperation = true
            previousNumber = Double(Result_lable.text!)!
            Result_lable.text = "/"
            operation = tag
        }else if tag == 12{
            isPerformingOperation = true
            previousNumber = Double(Result_lable.text!)!
            Result_lable.text = "*"
            operation = tag

        }else if tag == 13{
            isPerformingOperation = true
            previousNumber = Double(Result_lable.text!)!
            Result_lable.text = "-"
            operation = tag

        }else if tag == 14{
            isPerformingOperation = true
            previousNumber = Double(Result_lable.text!)!
            Result_lable.text = "+"
            operation = tag
            
        }else if tag == 15{
            if operation == 11 {
                Result_lable.text = String(previousNumber / numberOnscreen)

            }else if operation == 12{
                Result_lable.text = String(previousNumber * numberOnscreen)

            }else if operation == 13{
                Result_lable.text = String(previousNumber - numberOnscreen)

            }else if operation == 14{
                Result_lable.text = String(previousNumber + numberOnscreen)
                
            }
            
        }
    }
    
    
}
