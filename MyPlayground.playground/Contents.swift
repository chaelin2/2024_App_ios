import UIKit

func sum(a:Int, b:Int) ->Void{
    print(a+b)
}

print("hi")

sum(a: 4, b: 5)

var a: Int? = 10
var b: Int? = nil

var c: Int = a! // error 발생 X
var d: Int = b!

// 옵셔널 언래핑 if-let , guard-let
// if-let 옵셔널이 nil이 아닐 경우에만 수행
if let a1 = a{
    print("\(a1)")
}

guard let a1 = a else{
    //a가 nil일 때 수행
    return 
}
