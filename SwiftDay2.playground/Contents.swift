import UIKit

enum Weekday{
    //case mon, tue, wed
    case mon
    case tue
    case wed
    case thu
    case fri, sat, sun
}

var boolean: Bool
boolean = true
boolean = false

print()

var weekday:Weekday = Weekday.thu
weekday = .fri


class Sample{
    var mutableProperty :Int = 100
    
}




class Person{
    var name : String = ""
    
    func selfIntroduce(){
        print("my name is \(name)")
    }
    
    final func sayHello(){
        
    }
}

class Student : Person{
    override func selfIntroduce() {
        <#code#>
    }
    
    override func sayHello(){
    }
    }
}
