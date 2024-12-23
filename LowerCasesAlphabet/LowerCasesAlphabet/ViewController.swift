//
//  ViewController.swift
//  LowerCasesAlphabet
//
//  Created by 22 on 12/11/24.
// 사용자 입력을 받아서 소문자를 모으는 앱. 테이블 뷰에 //리스트 형식으로 오름차순 정렬


import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var lowerCastAlphabets: Set<Character> = []
    var lowerCastAlphabetsArray : Array<Character>=[]
    
    
    //set을 배열로 변환
    
    var sortedData:[String]{
        return lowerCastAlphabets.map{String($0) }.sorted()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }


    @IBAction func register(_ sender: UIButton) {
        let input = textField.text!
        if input.count==1{
            let char = Character(input)
            if char.isLowercase{
                
                lowerCastAlphabets.insert(char)
                lowerCastAlphabetsArray = Array(lowerCastAlphabets)
                lowerCastAlphabetsArray=lowerCastAlphabetsArray.sorted()
                
                print(lowerCastAlphabets)
                tableView.reloadData()
                
            }else{
                showAlert(on: self, title: "소문자가 아닙니다")
            }
        }else{
            showAlert(on: self, title: "한 글자가 아닙니다")
        }
    }
    
                func showAlert(on ViewController:UIViewController, title:String){
                    let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                    ViewController.present(alert, animated: true, completion: nil)
                }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lowerCastAlphabetsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String( lowerCastAlphabetsArray[indexPath.row])
        return cell
    }
}

