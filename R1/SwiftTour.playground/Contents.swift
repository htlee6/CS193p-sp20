// A Swift Tour
// Sourced from https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html
/*
 1# Simple Vaules
 */
var myVariable = 42
myVariable = 50
let myConstant = 42

let implicitInteger = 70
type(of: implicitInteger)
let implicitDouble = 70.0
type(of: implicitDouble)
let explicitDouble: Double = 70
type(of: explicitDouble)

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apple(s)"
let orangeSummary = "I have \(oranges) orange(s)"
let fruitSummary = "I have \(apples+oranges) pieces of fruit"

let quotation = """
I said "I have \(apples+oranges) pieces of fruit. "
And then I said "I have \(apples) apples. "
"""

var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1]
type(of: shoppingList)
var discArray = ["cat", 1, 20.0] as [Any]
discArray[2]
type(of: discArray)

var occupations = ["Malcom": "Captain", "Kaylee": "Mechanic"]
occupations["Jayne"] = "Public Relations"
type(of: occupations)

shoppingList.append("blue paint")
print(shoppingList)
shoppingList.count

let emptyArray = [String]()
let emptyDict = [String: Float]()
/* Since emptyArray and emptyDict are constants
   The following operations are denied
   Uncomment to check what will happen */
// emptyArray.append("new array element")
// emptyDict["newKey"] = 10.0

shoppingList = []
occupations = [:]

/*
 2# Control Flow
 */
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

var optionalString: String? = "Hello"
print(optionalString==nil)

var optionalName: String? = "John Appleseed"
optionalName = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    print("The optional name is nil")
}

let nickName: String? = "Joe"
let fullName: String? = "Joseph Noah"
let informalGreeting = "Hi \(fullName ?? nickName)"

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
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        print("Current kind: \(kind)")
        if number > largest {
            largest = number
        }
    }
}
print(largest)

var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

var totoal = 0
for i in 0..<4 {
    print(i)
    totoal += i
}
print(totoal)

/*
 3# Functions and Closures
 PS I am not quite familiar with the Closure concept
 */

func greet(person: String, day: String, lunchSpecial: String) -> String {
    return "Hello, \(person), today is \(day).\n Today's lunch special is \(lunchSpecial)"
}
greet(person: "Bob", day: "Thursday", lunchSpecial: "chicken salad")

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum1 = 0
    
    for score in scores {
        if score > max {
            max = score
        }
        if score < min {
            min = score
        }
        sum1 += score
    }
    return (min, max, sum1)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
let (min, max, sum) = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.max)
print(statistics.1)
min
max
sum

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer() -> ((Int)->Int) {
    func addOne(number: Int) -> Int {
        return number + 1
    }
    return addOne
}
var increment = makeIncrementer()
type(of: increment)
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

numbers.map({ (numbers: Int) -> Int in
    let result = 3 * numbers
    return result
})

numbers = [20, 19, 7, 12]
numbers.map({ (numbers: Int) -> Int in
    let result = numbers
    if result % 2 == 0 {
        return result
    } else {
        return 0
    }
})

numbers = [20, 19, 7, 12]
let mappedNumbers = numbers.map({number in 3 * number})
print(mappedNumbers)

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)

/*
 4# Objects and Classes
 */
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides. "
    }
    
    let lengthOfASide = 1
    func complexDescription(date: String) -> String {
        return simpleDescription() + "Each side is \(lengthOfASide) in length. \(date)"
    }
}

var myShape = Shape()
myShape.numberOfSides = 7
var shapeDescription = myShape.simpleDescription()

class NameShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides. "
    }
}

class Square: NameShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength). "
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

class Circle: NameShape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return 3.1415926 * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius \(radius). "
    }
}
let testCircle = Circle(radius: 3, name: "test circle")
testCircle.area()
testCircle.simpleDescription()

class EquilateralTriangle: NameShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength). "
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength, triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

/*
 5# Enumerations and Structures
 */

enum Rank:Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDecription() -> String {
        switch self{
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

let ace = Rank.ace
let aceRawValue = ace.rawValue

let eight = Rank.eight
let eightRawValue = eight.rawValue
let eightD = eight.simpleDecription()

if let convertedRank = Rank(rawValue: 3) {
    _ = convertedRank.simpleDecription()
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
        }
    }
}

let hearts = Suit.hearts
let heartDescription = hearts.simpleDescription()
let heartColor = hearts.color()

enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset). ")
case let .failure(message):
    print("Failure... \(message)")
}

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDecription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
/*
 6# Protocols and Extensions, temporarily skipped
 */

/*
 7# Error Handling, temporarily skipped
 */

/*
 8# Generics
 */

func makeArray<Item>(repeating item: Item, numberOfTimes: Int)->[Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "hello", numberOfTimes: 10)

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}

anyCommonElements([1,2,3], [3])
