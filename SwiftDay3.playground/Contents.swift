import UIKit

var greeting = "Hello, playground"
print(greeting)


enum 오류종류이름: Error{
    case 종류1
    case 종류2
    case 종류3
}


enum VendingMachine : Error{
    case invalidInput
    case insufficientFunds(moneyNeeded:Int)
    case outOfStock
}

class Person{
    var name: String
    var job: String?
    
    init(name: String) {
        self.name = name
    }
}
var person = Person(name: "keon")
