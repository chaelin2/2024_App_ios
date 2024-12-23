//
//  Truck.swift
//  Car
//
//  Created by 22 on 12/13/24.
//

import Foundation

class Truck: Car1{
    var diesel:Bool
    init(name: String, photo: String, description: String, diesel:Bool) {
        self.diesel = diesel
        super.init(name: name, photo: photo, description: description)
    }
    
    override func makeSound() -> String {
        return "\(name)은 트럭 배기음"
    }
    
}
