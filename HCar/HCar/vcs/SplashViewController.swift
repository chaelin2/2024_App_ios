//
//  SplashViewController.swift
//  HCar
//
//  Created by 22 on 12/17/24.
//

import UIKit
import FirebaseAuth

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            //self.showScreen(withIdentifier: "introViewController")
            if let user = Auth.auth().currentUser{
                print("현재 로그인된 사용자\(user.email ?? "이메일 없음")")
                self.showScreen(withIdentifier: "mainTabBarController")
            } else {
                print("현재 로그인된 사용자가 없습니다.")
                self.showScreen(withIdentifier: "introViewController")
            }
            
        }
        
    }
    
    private func showScreen(withIdentifier: String){
        if let mainVC = storyboard?.instantiateViewController(withIdentifier:  withIdentifier){
            mainVC.modalTransitionStyle = .crossDissolve // 부드러운 전환 효과
            mainVC.modalPresentationStyle = .fullScreen
            self.present(mainVC, animated: true, completion: nil)
        }
    }

   
}
