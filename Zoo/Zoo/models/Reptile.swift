//
//  Mammal.swift
//  Zoo
//
//  Created by 22 on 12/12/24.
//

import Foundation
import UIKit
class Reptile : Animal {
    var temperatureControl: Bool
    
    init(name:String, diet: String, photoName: String? = nil, photo: UIImage? = nil, temperatureControl: Bool) {
        self.temperatureControl = temperatureControl
        super.init(name: name, diet: diet,photoName: photoName,  photo: photo)
    
    }
    
    override func makeSound() -> String {
        return "\(name)은 ~~."
    }
}
