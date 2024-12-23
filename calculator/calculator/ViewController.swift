//
//  ViewController.swift
//  calculator
//
//  Created by 22 on 12/9/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelDisplay: UILabel!
    var plus = false
    var min = false
    var mul = false
    var div = false
    var op1=""
    var op2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        print("digit:\(digit)")
        if (!plus)&&(!min)&&(!mul)&&(!div){
            op1=op1+digit
            labelDisplay.text=op1
            
        }
        else{
            op2=op2+digit
            labelDisplay.text=op2
        }
        
    }
    
    @IBAction func plus(_ sender: UIButton) {
        plus=true
    }
    
    
    @IBAction func minus(_ sender: UIButton) {
        min = true
    }
    
    
    @IBAction func mul(_ sender: UIButton) {
        mul = true
    }
    
    @IBAction func div(_ sender: UIButton) {
        div=true
    }
    
    @IBAction func equ(_ sender: UIButton) {
        var answer:Int
        if (plus){
            answer = Int(op1)! + Int(op2)!
            labelDisplay.text=String(answer)
        }
        else if(min){
            answer = Int(op1)! - Int(op2)!
            labelDisplay.text=String(answer)
        }
        else if(mul){
            answer = Int(op1)! * Int(op2)!
            labelDisplay.text=String(answer)
        }
        else if(div){
            answer = Int(op1)! / Int(op2)!
            labelDisplay.text=String(answer)
        }
        op1=""
        op2=""
    
        
    }
}

