//
//  Car1.swift
//  Car
//
//  Created by 22 on 12/13/24.
//

import Foundation
protocol Sound{
    func makeSound()-> String
}

class Car1 : Sound{
    var name : String
    var photo : String
    var description: String
    
    init(name: String, photo: String, description: String) {
        self.name = name
        self.photo = photo
        self.description = description
    }
   
    
    func makeSound() -> String {
        return "배기음"
    }
}
