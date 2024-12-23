//
//  ViewController.swift
//  Car
//
//  Created by 22 on 12/13/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, CarCellDelegate {
    let collectionViewSpacing = 10.0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Market.shared.allCars().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carCell", for: indexPath) as! CarCell
        let car = Market.shared.allCars()[indexPath.row]
        cell.imageViewPhoto.image = UIImage(named: car.photo)
        cell.labelName.text = car.name
        cell.labelDescription.text = car.description
        cell.feat.text = getFeat(car:car)
        cell.delegate = self
        return cell
    }
    
    func getFeat(car:Car1) -> String{
        var feat = ""
        switch car {
        case let sports as Sports:
            feat = sports.convertible ? "open": "close"
        case let truck as Truck:
            feat = truck.diesel ? "디젤임": "no 디젤"
        case let sedan as Sedan:
            feat = sedan.electric ? "전기": "no 전기"
            
        default: break
            
        }
        return feat
    }
    
    func didTapPhoto(at index: Int) {
        let car = Market.shared.allCars()[index]
        
    }
    
    func didTapRemove(at index: Int) {
        Market.shared.removeCar(at: index)
        collectionView.reloadData()
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width:CGFloat = (collectionView.frame.width - collectionViewSpacing) / 2
        return CGSize(width: width, height: width * 1.2)
    }

}

