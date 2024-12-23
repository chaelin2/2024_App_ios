//
//  Sedan.swift
//  Car
//
//  Created by 22 on 12/13/24.
//

import Foundation

class Sedan: Car1{
    var electric:Bool
    init(name: String, photo: String, description: String, electric:Bool) {
        self.electric = electric
        super.init(name: name, photo: photo, description: description)
    }
    
    override func makeSound() -> String {
        return "\(name)은 전기차 소리"
    }
    
}
