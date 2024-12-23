//
//  CarListManager.swift
//  HCar
//
//  Created by 22 on 12/17/24.
//

import Foundation

class CarListManager{
    static let shared = CarListManager()
    private init() {}
    
    public var cars: [Car] = []
//    private var cars: [Car] = [
//        Car(name: "The new G-Class", price: 17900, year: 2024, imageName: "g"
//            /*image: nil*/
//           ),
//        Car(name: "제네시스 G80 가솔린", price: 5000, year: 2020, imageName: "genesis"
//            //image: nil
//           ),
//        Car(name: "포드 머스탱 5.0 GT", price: 7990, year: 2024, imageName: "mustang"
////            image: nil
//           ),
//        Car(name: "BMW M8 컴페티션 쿠페", price: 24040, year: 2020, imageName: "bmw"
////            image: nil
//           )
//    ]
//    
    func allCars() -> [Car] {
        return cars
    }
    
    func setAllCars(cars: [Car]){
        self.cars = cars
        
    }
//
//    func addCar(_ car: Car){
//        cars.append(car)
//    }
}
