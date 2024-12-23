//
//  ViewController.swift
//  TabBar
//
//  Created by 22 on 12/10/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
        tableView
            .dequeueReusableCell(withIdentifier: <#T##String#>, for: IndexPath)
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

    var memo: [String]=[]
    
    
    @IBAction func add(_ sender: UIButton) {
        if(textField.text != ""){
            memo.append(textField.text!)
        }
        tableView.reloadData()
        textField.text=""
    }
    
}

