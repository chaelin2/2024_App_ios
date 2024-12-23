//
//  ViewController.swift
//  VindingMachine
//
//  Created by 22 on 12/16/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelItemPrice: UILabel!
    @IBOutlet weak var textFieldCount: UITextField!
    @IBOutlet weak var labelDisplay: UILabel!
    @IBOutlet weak var labelItemCount: UILabel!
    var deposit : Int = 0
    var itemCount: Int = 100
    let itemPrice: Int = 500
    
    
    let vendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        labelItemCount.text = "남은수량:\(itemCount)"
        labelItemPrice.text = "개당 가격\(itemPrice)"
    }

    @IBAction func addDeposit(_ sender: UIButton) {
        if let depositAdded = sender.titleLabel?.text,  let depositAddedInt = Int(depositAdded){
            vendingMachine.receiveMoney(depositAddedInt)
            //deposit += depositAddedInt
            //print("depositAdded: \(depositAdded)")
            labelDisplay.text = String(deposit)
        } else {
            showAlert(title: "에러", message: "투입 금액이 적절하지 않습니다.")
        }
        
    }
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func purchase(_ sender: UIButton) {
        //if let itemcountOrder = Int((textFieldCount?.text!)!){
        if let itemCounterOrder = textFieldCount?.text, let itemCountOderInt = Int(itemCounterOrder){
            let change = deposit - (itemCountOderInt * itemPrice)
            if change < 0{
                showAlert(title: "오류", message: "수량이 투입 금액보다 많습니다.")
                return
            }
            showAlert(title: "구입완료", message: "주문 수량 \(itemCounterOrder), 잔돈: \(change)")
            deposit = 0
            labelDisplay.text = String(deposit)
            itemCount -= itemCountOderInt
            labelItemCount.text = "남은수량 \(itemCount)"
            textFieldCount.text = ""
        } else{
            showAlert(title: "오류", message: "수량 확인하세요")
        }
        
    }
    
}

