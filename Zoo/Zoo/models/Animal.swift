//
//  Animal.swift
//  Zoo
//
//  Created by 22 on 12/12/24.
//

import Foundation
import UIKit

protocol SoundMaking{
    func makeSound()-> String
}

class Animal: SoundMaking {
    var name: String
    var diet : String
    var photoName : String?
    var photo : UIImage?
    
    init(name: String, diet: String, photoName: String? = nil, photo :UIImage? = nil) {
        self.name = name
        self.diet = diet
        self.photo = photo
        self.photoName = photoName
    }
    
    func makeSound() -> String {
        return "일반적인 동물소리"
    }
    
}
