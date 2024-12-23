//
//  ViewController.swift
//  HCar
//
//  Created by 22 on 12/17/24.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage

class HomeViewController: UIViewController {
    let db = Firestore.firestore()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        //tableView.reloadData()
        fetchCars()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func fetchCars(){
        db.collection("cars").getDocuments{ (snapshot, error) in
            if let error = error{
                print("Error getting documents: \(error)")
                return
            }
            
            if let snapshot = snapshot {
                            CarListManager.shared.cars = snapshot.documents.map { document in
                                do {
                                    return try document.data(as: Car.self)
                                } catch {
                                    print("Error decoding document \(document.documentID): \(error)")
                                    return nil
                                }
                            }.compactMap { $0 }
                            print("Fetched Cars: \(CarListManager.shared.cars)")
                            self.tableView.reloadData()
                        }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CarListManager.shared.allCars().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carTableViewCell", for: indexPath) as!
        CarTableViewCell
        let car = CarListManager.shared.allCars()[indexPath.row]
//        cell.imageViewCar.image = /*car.image ?? */UIImage(named: car.imageName ?? "")
        
//        if let url = URL(string:car.image){
//            let data = try? Data(contentsOf: url)
//            if let imageData = data{
//                cell.imageViewCar.image = UIImage(data: imageData)
//            }
//        }
        // 차량 이미지 비동기적으로 불러오기
        if let url = URL(string:car.image){
            URLSession.shared.dataTask(with: url){
                data, response, error in
                if let error = error{
                    print("errror \(error)")
                    return
                }
                if let data = data, let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        cell.imageViewCar.image = image
                    }
                }
            }.resume()
        }
        
        cell.labelName.text = car.name
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        if let formattedNumber = formatter.string(from: NSNumber(value: car.price)){
            cell.labelPrice.text = "\(formattedNumber)만원"
        }
        cell.labelYear.text = "\(car.year)년식"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selectedCar = CarListManager.shared.allCars()[indexPath.row]
        print("선택된 차량 정보 : \(selectedCar.name)")
        
        performSegue(withIdentifier: "showCarDetail", sender: selectedCar)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "showCarDetail", let carInfoVC = segue.destination as? CarInfoViewController, let selectedCar = sender as? Car {
            
            carInfoVC.car = selectedCar
        }
    }
}
