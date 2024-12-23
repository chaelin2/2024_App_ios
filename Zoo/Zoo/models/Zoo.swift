//
//  Zoo.swift
//  Zoo
//
//  Created by 22 on 12/12/24.
//

import Foundation

class Zoo{
    static let shared = Zoo() //싱글톤 패턴
    private init() {}
    
    private var animals: [Animal] = [
        Mammal(name: "순록", diet: "초식", photoName: "rein.webp", shortFur: true),
        Bird(name: "펭귄", diet: "초식", photoName: "penguin", canFly:false),
    
        Mammal(name: "북극곰", diet: "육식", photoName: "bear.jpg", shortFur: true),
        Mammal(name: "북극여우", diet: "초식", photoName: "fox.webp", shortFur: true),
    ]
        
    func allAnimals() -> [Animal] {
            return animals
        }
    
    func removeAnimal(at index : Int){
        animals.remove(at: index)
    }
    func addAnimal(_ animal: Animal){
        animals.append(animal)
    }
    
}
