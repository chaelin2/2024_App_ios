//
//  ReplyViewController.swift
//  navigation
//
//  Created by 22 on 12/10/24.
//

import UIKit

//protocol ReplyDelegate{
//    func reply(_ controller: ReplyViewController, message: String)
//}

class ReplyViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    //var delegate:ReplyDelegate?
    
    var message = ""
    var onReply: ((String)->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = message

        // Do any additional setup after loading the view.
    }
    

    @IBAction func barButtonOK(_ sender: Any) {
        onReply?(textField.text!)
//        if delegate != nil{
//            delegate?.reply(self, message: textField.text!)
//        }
        //뒤로가기
        self.navigationController?.popViewController(animated: true)
    }


}
