//: [Previous](@previous)

//abcd


import Foundation

var str = "Hello, playground"
print(str)


//: [Next](@next)


var myVariable = 42
myVariable = 50

let myConstant = 42
//myConstant = 43

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble:Double = 70

let label = "The width is"
let width = 94
let widthLabel = label + " " + String(width)
let widthLabel2 = "\(label) \(width)"

var shoppingList = ["cai1", "cai2", "cai3"]
//shoppingList[1] = "cai2-2"
//shoppingList[-1] = "cai"
//shoppingList[3] = "cai4"
//shoppingList[100] = "cai100"

//shoppingList = ["haha"]
shoppingList.append("cai4")
print(shoppingList)


var dic = ["key1":"value1", "key2":"value2",]
dic["key2"] = "value2-2"
dic["key3"] = "value4"

print(dic)

let emptyArray = [String]()
let emtpyDic = [String:Float]()
//var emptyArray2 = []
//var emptyDic2 = [:]

var optionalString: String? = nil //"Hello"
print(optionalString == nil)

var optionName: String? = nil //"KaiKai"
var greeting = "Hello!"
if let name = optionName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, else"
}
let defaultName = "Default"
greeting = "Hello, \(optionName ?? defaultName)"
greeting = "Hello, \(optionName ?? "Default3")"

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}


let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25, 36],
]
var largest = 0
var maxKind = ""
for (kind,numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            maxKind = kind
        }
    }
}
print("largest=\(largest) maxKind=\(maxKind) ")

var total = 0
let length = 4 //interestingNumbers["Prime].count
for i in 1..<length {
    total += i
}
print(total)

total = 0
for i in 1...4 {
    total += i
}
print(total)


func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person:"Bob", day: "Tuesday")

func greet(_ person: String, _ day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("Bob2", "Tuesday")


func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}

let statistics = calculateStatistics(scores:[5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.0)

func returnFifteen(_ param:Int) -> Int {
    var y = 10 + param
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen(1)

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

var newNumbers = numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
print (newNumbers)


newNumbers = numbers.map({
    (number: Int) -> Int in
    return number % 2 == 0 ? number : 0
})
print (newNumbers)

newNumbers = numbers.map({ number in 3 * number })
print(newNumbers)

newNumbers = numbers.map({$0 % 2 == 0 ? $0 : 0 })
print(newNumbers)

let sortedNumbers = numbers.sorted { $0 < $1 }
print(sortedNumbers)

var aa = 1e-155 //0.00000000000000001
var a =  1e153 / aa //max 1e+308左右
//var b =  1e154 &* 1e154

greeting = "Kai, Tag0"
greeting.count
greeting += "🐶\u{1F1FA}\u{1F1F8}"
greeting.count
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(before: greeting.index(before: greeting.endIndex))]
let beforeLastIndex = greeting.index(before: greeting.endIndex)
greeting[beforeLastIndex]
greeting[greeting.index(greeting.endIndex, offsetBy: -2)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

var indices = greeting.indices
for index in indices {
    print("\(greeting[index]) ", terminator: (index == beforeLastIndex ? "\n" : " "))
}

for codeUnit in greeting.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")

for codeUnit in greeting.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")

for scalar in greeting.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")

greeting.unicodeScalars.count
for scalar in greeting.unicodeScalars {
    print("\(scalar) ", terminator: "")
}

let index2 = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index2]
let newString = String(beginning)

// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

// 打印输出“These two strings are considered equal”

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

let minuteInterval = 5
for tickMark in stride(from: 0, to: 15, by: minuteInterval) {
    print("tick1=\(tickMark)") //不含15
}

for tickMark in stride(from: 0, through: 15, by: minuteInterval) {
    print("tick2=\(tickMark)") //含15
}

func greet(person: String, from hometown: String = "China") -> String {
    return "Hello \(person)!  com from \(hometown)."
}
print(greet(person: "Bill", from: "ShangHai"))
print(greet(person: "Bill"))

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

