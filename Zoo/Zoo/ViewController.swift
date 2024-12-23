//
//  ViewController.swift
//  Zoo
//
//  Created by 22 on 12/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    let collectionViewSpacing = 10.0
//    var arrImageName: [String] = ["penguin", "fox", "bear","rein" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            collectionView.reloadData()
        }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, AnimalCellDelegate{
    func didTapPhoto(at index: Int) {
        let animal = Zoo.shared.allAnimals()[index]
        let alert = UIAlertController(title: animal.makeSound(), message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style:  .default))
        present(alert, animated: true)
    }
    
    func didTapRemove(at index: Int) {
        Zoo.shared.removeAnimal(at: index)
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Zoo.shared.allAnimals().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "animalCell", for: indexPath) as! AnimalCell
        let animal = Zoo.shared.allAnimals()[indexPath.row]
//        cell.imageViewPhoto.image = UIImage(named: arrImageName[indexPath.row])
        cell.imageViewPhoto.image = animal.photo ?? UIImage(named:animal.photoName ?? "")
        cell.labelDiet.text = "식성:  " + animal.diet
        cell.labelName.text = animal.name
        cell.labelTrait.text  = getTrait(animal: animal)
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
        
//        var trait = ""
//        switch animal {
//        case let mammal as Mammal:
//            trait = mammal.shortFur ? "털 짧음": "털 김"
//        case let bird as Bird:
//            trait = bird.canFly ? "날아": "못날아"
//        case let reptile as Reptile:
//            trait = reptile.temperatureControl ? "온도조절가능": "온도 조절 불가"
//            
//        default: break
//            
//        }
        
    }
    
    func getTrait(animal:Animal) -> String{
        var trait = ""
        switch animal {
        case let mammal as Mammal:
            trait = mammal.shortFur ? "털 짧음": "털 김"
        case let bird as Bird:
            trait = bird.canFly ? "날아": "못날아"
        case let reptile as Reptile:
            trait = reptile.temperatureControl ? "온도조절가능": "온도 조절 불가"
            
        default: break
            
        }
        return trait
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width:CGFloat = (collectionView.frame.width - collectionViewSpacing) / 2
        return CGSize(width: width, height: width * 1.2)
    }
    
    
}

