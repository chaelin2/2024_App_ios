import UIKit

var greeting = "Hello, playground"
print(greeting)
UIImage(systemName: "star")

var sum = 0
for i in 1...10{
    sum+=i
}

// MARK: - 주석, 구분선 생김.
//주석

/*여러줄 주석ㄴㄹ
 ㄴㄹㄴㄹㄴㄹ*/

print(greeting)
dump(greeting)

let a1 = "안녕" + greeting + "반가워"
let a2 = "안녕 \(greeting)"
print(a1)
print(a2)

let constant: String = "변경 불가"
var variable:String = "변경 가능"
variable = "새로운 값 할당 가능"

var c1:Bool = true
c1 = false

var d1=100
var d2:UInt=100
//UInt 양의 정수만 할당 가능.

print("type: \(type(of: d2))")


//Float : 32bit
//Double : 64bit

//random
print(Int.random(in: -100...100))
Double.random(in: -100...100)
Float.random(in: -100...100)

//string
var g1:String = "abcd"
g1.append("efg")
g1+="hi"
print("count:\(g1.count)")
print(g1.isEmpty)


g1.hasPrefix("ab")
g1.hasSuffix("h")

print(g1.uppercased())
print(g1.lowercased())

var st1="""
ssfsdgagd
adgbadsf
sdfsfs
"""
print(st1)


//MARK: Any, AnyObject, nil
var someAny: Any = 100
//Any : 어떤 타입의 값도 할당 가능.

class SomeClass2{}
var someAnyObject: AnyObject = SomeClass2()
// 클래스의 객체만 할당 가능.
// nil : 아무것도 없는 값.


//tuple
var someData:(String, Int, Double, String)=("abc", 10, 10.2, "sfsf")
print("\(someData.2)")

//컬렉션 - Array, Dictionary, Set
var arr:Array<Int> = Array<Int>()
arr.append(3)
print(arr)
arr.contains(3)
arr.append(4)
arr.remove(at: 0)

var dict:Dictionary<String, Any> = [String:Any]()
dict["key"] = "value"
print(dict)
dict.removeValue(forKey: "key")
dict["a"]=3
dict["a"]=nil

var intSet:Set<Int> = Set<Int>()
intSet.insert(2)
intSet.insert(5)
print(intSet)

intSet.remove(2)
intSet.contains(5)

print(intSet)

let setA:Set<Int> = [1,2,3,4]
let setB:Set<Int> = [2,3,5,6]

