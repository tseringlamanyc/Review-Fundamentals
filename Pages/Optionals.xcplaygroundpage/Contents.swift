import Foundation

//MARK:- OPTIONALS - A type in swift that says there could exist a value or not on an object

var dict = [String: String]()

//MARK:- FORCE WRAPP
dict["Tsering"] = "Lama"

let lastName = dict["Tsering"]! // force wrapp
print(lastName)

// let otherLastName = dict["TSM"]!  FATAL ERROR , TSM doesnt exist in the dict

//MARK:- IMPLICITLY UNWRAPPED OPTIONALS
var name: String!  // no need to unwrapp later

name = "Bob"

let unwrappedName: String = name
print(unwrappedName)

//MARK:- NIL COELESCING
let otherLastName = dict["TSM"] ?? "wack"  // default value if value doesnt exist
print(otherLastName)

//MARK:- OPTIONAL BINDING (if let, if var)

if let lastName = dict["Tsering"] { // bins value to lastname
    print(lastName)
} else {
    print("no lastName")
}

//MARK:- GUARD
func printName(string: String?) {
    guard let string = string else {
        print("no name given")
        return // exist the function
    }
    
    print(string)
    
}

printName(string: nil)

//MARK:- WHILE LET
// abstract data structure

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

func printNode(node: Node?) {
    var node = node
    while let currentNode = node {
        print(currentNode.value)
        node = currentNode.next
    }
}

printNode(node: node1)

//MARK:- OPTIONAL CHAINING

var userName: String?
var password: String?

userName = "Tsering"

if let username = userName,
   let password = password {
    print("user entered both values")
} else {
    print("values are missing")
}

//MARK:- EXERCISE
var userNameOne: String? = "Test User"

if let userNameOne = userNameOne {
    print("The username is the \(userNameOne)")
}

var userNameTwo: String? = nil
print("The username is \(userNameTwo ?? "undefined")")


var rectOneWidth: Double? = 5
var rectOneHeight: Double? = 10

if let rectOneWidth = rectOneWidth, let rectOneHeight = rectOneHeight {
    print("The area is \(rectOneWidth * rectOneHeight)")
}

var rectTwoWidth: Double? = nil
var rectTwoHeight: Double? = nil

if let rectTwoWidth = rectTwoWidth, let rectTwoHeight = rectTwoHeight {
    print("The area is \(rectTwoWidth * rectTwoHeight)")
} else {
    print("Area couldnt be calculated")
}

var userOneName: String? = "Anne"
var userOneAge: Int? = 15
var userOneHeight: Double? = 70

if let userOneName = userOneName, let userOneAge = userOneAge, let userOneHeight = (userOneHeight) {
    print("Hi \(userOneName). You are \(userOneAge) and \(userOneHeight / 12) tall")
}

var favoriteNumber = Bool.random() ? Int.random(in: 0...10) : nil

if let favoriteNumber = favoriteNumber {
    print("Fav num is \(favoriteNumber)")
} else {
    print("no number")
}

var numOne = Bool.random() ? Int.random(in: 0...10) : nil
var numTwo = Bool.random() ? Int.random(in: 0...10) : nil
var numThree = Bool.random() ? Int.random(in: 0...10) : nil

if let numOne = numOne, let numTwo = numTwo, let numThree = numThree {
    print("The total sum is \(numOne + numTwo + numThree)")
} else {
    print("Couldnt calculate sum")
}

var numbers6 = [Int?]()

for _ in 0..<10 {
    numbers6.append(Bool.random() ? Int.random(in: 0...100) : nil)
}

var sum = 0

for num in numbers6 {
    if let validNum = num {
        sum += validNum
    }
}

print("The sum is \(sum)")

print(numbers6.compactMap { $0 }.reduce(0, +))
