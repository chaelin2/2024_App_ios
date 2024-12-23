//
//  ViewController.swift
//  gift
//
//  Created by 22 on 12/10/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageViewGift: UIImageView!
    @IBOutlet weak var labelName: UITextField!
    @IBOutlet weak var labelMessage: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func g1(_ sender: UIButton) {
        imageViewGift.image = UIImage(named: "watch")
    }
    
    
    @IBAction func g2(_ sender: UIButton) {
        imageViewGift.image = UIImage(named: "w2.jpg")
    }
    
    
    @IBAction func g3(_ sender: UIButton) {
        imageViewGift.image = UIImage(named: "w3.avif")
    }
    
    @IBAction func buttonOK(_ sender: UIButton) {
        let selectedDate = datePicker.date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        let formattedDate = formatter.string(from: selectedDate)
        let alertController = UIAlertController(title: "\(labelName.text!)", message: "메시지 \(labelMessage.text!)\n배송날짜: \(formattedDate)", preferredStyle: .alert )
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        self.present(alertController, animated:true, completion:nil)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
    }
    
}
