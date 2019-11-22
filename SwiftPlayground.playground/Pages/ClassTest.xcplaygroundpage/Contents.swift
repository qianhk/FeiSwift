
import Foundation

class Shape {
    var numberOfSides = 0
    let constHaha = 2
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    func setSide(side:Int) -> Void {
        numberOfSides = side
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
shape.setSide(side: 3)
shapeDescription = shape.simpleDescription()
//shape.constHaha = 3

class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(_ name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var namedShape = NamedShape("SanJiao")
namedShape.numberOfSides = 3
print(namedShape.simpleDescription())

class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name)
        super.numberOfSides = 4
    }

    func area() ->  Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength), name=\(super.simpleDescription())."
    }
    
    var perimeter: Double {
        get {
            return sideLength * 4
        }
        set {
            sideLength = newValue / 4
        }
    }
    
    deinit {
        print("deinit Square")
    }
}
let square = Square(sideLength: 5, name: "my test square")
square.area()
square.simpleDescription()
print(square.perimeter)
square.perimeter = 24
print(square.perimeter)
print(square.area())

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
            return Double(numberOfSides) * sideLength
        }
        set {
            sideLength = newValue / Double(numberOfSides)
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            print("will set new square from triangle")
            square.sideLength = newValue.sideLength
//            square = Square(sideLength: newValue.sideLength, name: "FromTriangle")
            
        }
    }
    var square: Square {
        willSet {
            print("will set new triangle from square")
            triangle.sideLength = newValue.sideLength
//            triangle = EquilateralTriangle(sideLength: newValue.sideLength, name: "FromSquare")
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
print("will set new value")
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print("\(triangleAndSquare.triangle.sideLength) \(triangleAndSquare.triangle.name)")

let optionalSquare: Square? = nil //Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.jack
let aceRawValue = ace.rawValue
let threeRawValue = Rank.three.rawValue

if let convertedRank = Rank(rawValue:11) {
    let threeDescription = convertedRank.simpleDescription()
} else {
    print("no right rank enum")
}

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
//        case .diamonds:
//            return "red"
        default:
            return "unknownColor"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
var color = hearts.color()
color = Suit.diamonds.color()

enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure...  \(message)")
}
//print(success.rawValue)

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}

var number = 7;
print(number.simpleDescription)
number.adjust()
print(number.simpleDescription)
let protocolValue : ExampleProtocol = number
print(protocolValue.simpleDescription)

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "None" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

var returnStr = try send(job: 100, toPrinter: "Have")
print(returnStr)

do {
    returnStr = try send(job: 100, toPrinter: "None")
    print(returnStr)
} catch PrinterError.onFire {
    print("haha Error: onFire")
} catch {
    print(error)
}

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "None")

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        print("after return result at defer")
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    print("before return result: \(result) isOpen=\(fridgeIsOpen)")
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)


func makeArray<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(item: "knock", numberOfTimes: 4)


enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)


func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [30])

func commonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Element]
    where T.Element: Equatable, T.Element == U.Element
{
    var list = [T.Element]()
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                list.append(lhsItem)
            }
        }
    }
    return list
}
var result = commonElements([1, 2, 3], [3, 2])


