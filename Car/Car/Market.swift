//
//  Market.swift
//  Car
//
//  Created by 22 on 12/13/24.
//

import Foundation

class Market{
    static let shared = Market()
    private init(){}
    private var cars: [Car1]=[
        Sports(name: "ferrari 12cilindri", photo: "ferrari", description: "페라리에서 2024년부터 생산 중인 2인승 프론트 미드 엔진, 후륜구동 GT카", convertible: true),
        Truck(name: "dump truck", photo: "dump", description: "페라리에서 2024년부터 생산 중인 2인승 프론트 미드 엔진, 후륜구동 GT카", diesel: true)
        
    ]
    
    func allCars() ->[Car1]{
        return cars
    }
    
    func removeCar(at index: Int){
        cars.remove(at: index)
    }
}
