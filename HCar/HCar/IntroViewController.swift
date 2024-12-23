//
//  IntroViewController.swift
//  HCar
//
//  Created by 22 on 12/18/24.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

enum SignupOrLogin {
    case signup
    case login
}

class IntroViewController: UIViewController {
    @IBOutlet weak var buttonComplete: UIButton!
    @IBOutlet weak var textFieldPW: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldNick: UITextField!
    
    
    var signupOrLogin = SignupOrLogin.signup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            signupOrLogin = .signup
            textFieldNick.isHidden = false
            buttonComplete.setTitle("회원가입", for: .normal)
        } else {
            signupOrLogin = .login
            textFieldNick.isHidden = true
            buttonComplete.setTitle("로그인", for: .normal)
        }
    }
    
    
    @IBAction func complete(_ sender: UIButton) {
        switch signupOrLogin {
        case . signup:
            signup()
            
        case . login:
            login()
            
        }
    }
    
    func signup(){
        guard let email = textFieldEmail.text, !email.isEmpty,
              let password = textFieldPW.text, !password.isEmpty,
              let nickname = textFieldNick.text, !nickname.isEmpty else {
            showAlert(title: "Error", message: "모든 필드를 입력해주세요")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){
            (AuthDataResult, error) in
            if let error = error {
                self.showAlert(title: "회원가입오류", message: error.localizedDescription)
                return
            }
            
            print("회원가입 성공")
            self.saveUser(email: email, nickname: nickname)
        }
        
    }
    
    func saveUser(email: String, nickname: String){
        let user = User(email: email, nickname: nickname)
        let db = Firestore.firestore()
        
        db.collection("users").document(Auth.auth().currentUser!.uid).setData([
            "email": user.email,
            "nickname": user.nickname
        ]){
            error in
            if let error = error {
                self.showAlert(title: "Firestore 오류", message: error.localizedDescription)
            } else {
                self.navigateToHomeScreen()
            }
        }
    }
    
    func login(){
        guard let email = textFieldEmail.text, !email.isEmpty,
              let password = textFieldPW.text, !password.isEmpty else {
                  showAlert(title: "error", message: "이메일과 비밀번호를 입력해주세요")
                  return
              }
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                self.showAlert(title: "로그인 오류", message: error.localizedDescription)
                return
            }
            
        }
    }
    
    
    func showAlert( title: String,  message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func navigateToHomeScreen(){
        if let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "mainTabBarController"){
            //self.navigationController?.pushViewController(homeVC, animated: true)
            mainVC.modalTransitionStyle = .crossDissolve
            mainVC.modalPresentationStyle = .fullScreen
            self.present(mainVC, animated: true, completion: nil)
        }
    }
}
