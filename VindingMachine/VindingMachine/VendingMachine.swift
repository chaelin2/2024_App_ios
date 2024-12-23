//
//  VendingMachine.swift
//  VindingMachine
//
//  Created by 22 on 12/16/24.
//

import Foundation

enum VendingMachine: Error {
    case insufficientFunds(moneyNeeded: Int)
}
class VendingMachine{
    var deposit : Int = 0
    var itemCount: Int = 10
    let itemPrice: Int = 500
    
    // 돈 받기 메서드
    func receiveMoney(_ money : Int){
        deposit += money
        print("총 투입금액: \(deposit)")
    }
    
    //물건 팔기
    func vend(numberOfItems numberOfItemsToVend:Int) throws{
        let change = deposit - (numberOfItemsToVend * itemPrice)
        
    }
}
