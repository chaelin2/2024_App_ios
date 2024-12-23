import UIKit

var greeting = "Hello, playground"
print(greeting)

func sum(numbers: Int...) ->Int {
    return numbers.reduce(0, +)
}
print(sum(numbers: 1,2,3))

let multiply = { (a: Int, b: Int) -> Int in
    return a*b
}
print( multiply(4, 3))
