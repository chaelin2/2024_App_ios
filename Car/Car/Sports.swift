//
//  Sports.swift
//  Car
//
//  Created by 22 on 12/13/24.
//

import Foundation

class Sports: Car1{
    var convertible: Bool
    
    init(name: String, photo: String, description: String, convertible: Bool) {
        self.convertible = convertible
        super.init(name: name, photo: photo, description: description)
        
    }
    
    override func makeSound() -> String {
        return "\(name)은 스포츠카 배기음"
    }
}
