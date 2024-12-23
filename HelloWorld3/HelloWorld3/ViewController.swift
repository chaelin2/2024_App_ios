//
//  ViewController.swift
//  HelloWorld3
//
//  Created by 22 on 12/9/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var labelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonOK(_ sender: UIButton) {
        labelName.text = "My name is "+textFieldName.text!
    }
    

}

