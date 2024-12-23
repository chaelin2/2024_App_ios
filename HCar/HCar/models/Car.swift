//
//  Car.swift
//  HCar
//
//  Created by 22 on 12/17/24.
//

import Foundation
import UIKit

struct Car: Codable{
    let name: String
    var price : Int
    let year: Int
    //let imageName: String?
    //let image: UIImage?
    let image: String
    let details : String
    let userId : String //판매자
    let isSale : Bool?
    var id: String?
//
//    init(name: String, price: Int, year: Int, imageName: String, image: UIImage) {
//        self.name = name
//        self.price = price
//        self.year = year
//        self.imageName = imageName
//        self.image = image
//    }
}
