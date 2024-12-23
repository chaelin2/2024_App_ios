//
//  ViewController.swift
//  calculator2
//
//  Created by 22 on 12/10/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelDisplay: UILabel!
    var inTheMiddleOfTyping = false
    var firstValue=0
    var operation = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        print("digit:\(digit)")
        if inTheMiddleOfTyping{
            let textCurrent = labelDisplay.text!
            labelDisplay.text = textCurrent+digit
        }
        else{
            labelDisplay.text = digit
        }
        inTheMiddleOfTyping = true
    }
    
    @IBAction func operate(_ sender: UIButton) {
        operation = sender.currentTitle!
        print("operation:\(operation)")
        
        firstValue = Int(labelDisplay.text!)!
        print("fistvalue:\(firstValue)")
        inTheMiddleOfTyping = false
    }
    
    
    @IBAction func equal(_ sender: UIButton) {
        let secondValue = Int(labelDisplay.text!)!
        var result = 0
        switch operation {
        case "+":
            result = firstValue + secondValue
        case "-":
            result = firstValue-secondValue
        case"x":
            result = firstValue * secondValue
        case"/":
            result = firstValue/secondValue
        default:
            break
        }
        labelDisplay.text = String(result)
        
        inTheMiddleOfTyping = false
        firstValue = 0
    }
    
    
    @IBAction func initial(_ sender: UIButton) {
        inTheMiddleOfTyping = false
        firstValue = 0
        labelDisplay.text = "0"
    }
    
}

