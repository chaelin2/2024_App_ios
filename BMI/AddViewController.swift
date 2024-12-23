//
//  AddViewController.swift
//  BMI
//
//  Created by 22 on 12/12/24.
//

import UIKit

protocol AddViewControllerDelegate:AnyObject{
    func didUpdateBMI(tuple:(String, String, String, String, String))
}

class AddViewController: UIViewController {
    @IBOutlet weak var textFieldWeight: UITextField!
    
    @IBOutlet weak var textFieldHeight: UITextField!
    var tuple:(String, String, String, String, String) = ("","", "", "", "")
    
    weak var delegate: AddViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonOK(_ sender: UIBarButtonItem) {
        guard let heightText = textFieldHeight.text, let height = Double(heightText), let weightText = textFieldWeight.text, let weight = Double(weightText) else{
            print("키를 바르게 입력해주세요.")
            showAlert(message: "키와 몸무게를 바르게 입력해주세요. ")
            
            
            return
        }
        print("키:\(height)")
        print("몸무게\(weight)")
        let bmi = calculateBMI(height: height, weight: weight)
        print("BMI\(bmi)")
        
        let dataFormmater = DateFormatter()
        dataFormmater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let currentDateString = dataFormmater.string(from: Date())
        
        tuple.0 = currentDateString
        tuple.1 = heightText
        tuple.2 = weightText
        tuple.3 = String(format: "%.2f", bmi)
        tuple.4 = "정상"
        
        let status: String
        
        switch bmi{
        case ..<18.5:
            status = "저체중"
        case 18.5..<24.9:
            status = "정상"
        case 25..<29.9:
            status = "과체중"
        default:
            status = "비만"
        
        }
        tuple.4 = status
        print(tuple)
        
        
        delegate?.didUpdateBMI(tuple: tuple)
        
        //뒤로가기
        navigationController?.popViewController(animated: true)
        
    }
    func calculateBMI(height: Double, weight: Double)-> Double{
        let heightInMeters = height / 100
        return weight / (heightInMeters * heightInMeters)
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: "알림", message: message, preferredStyle:  .alert)
        alert.addAction(UIAlertAction(title: "확인", style:  . default))
        present(alert, animated: true)
    }
    

}
