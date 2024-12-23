//
//  ViewController.swift
//  navigation
//
//  Created by 22 on 12/10/24.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var reply = "답장내용"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool){
        label.text = reply
        print("viewWillAppear")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let replyVC = segue.destination as!
        ReplyViewController
        if segue.identifier == "ReplyVC"{
            replyVC.message = textField.text!
            
        }
        
        replyVC.onReply = {
            replyMessage in self.reply = replyMessage
        }
    }
    
    


}

