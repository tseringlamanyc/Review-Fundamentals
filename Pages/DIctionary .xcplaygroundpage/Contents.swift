import UIKit

//MARK:- DICTIONARY - A collection of unordered key, value pairs. The key needs to be unique.
// The keys of a dictionary are required to conform to the Hashable protocol

//MARK:- GENERIC INITIALIZER
var usingGeneric = Dictionary<String, Int>()
usingGeneric["Tsering"] = 25
print(usingGeneric)

//MARK:- SUBSCRIPT SYNTAX
var subscriptDict = [Int: Int]()
subscriptDict[2020] = 11
print(subscriptDict)

subscriptDict[2020] = 12  // override
print(subscriptDict)

//MARK:- DICTIONARY LITERAL
var cities = ["ktm": "Nepal", "nyc": "USA", "Mumbai": "India"]  // cannot have duplicate keys, ["ktm": "cool"]
print(cities)

struct Car: Hashable {
    let make: String
    let wheels: Int
    let color: UIColor
}

let nissan = Car(make: "Nissan", wheels: 4, color: .black)
let honda = Car(make: "honda", wheels: 4, color: .red)

var carDict = [nissan: 10, honda: 15]  // nissan and honda are hashable keys

//MARK:- INSPECTING A DICTIONARY

// isEmpty
if carDict.isEmpty {
    print("no cars left")
} else {
    print("cars are here")
}

// count
print(carDict.count)

//MARK:- ACCESSING KEY AND VALUES

// subscript [key] - always returns an optional , key may no exist
let numofNissan = carDict[nissan] ?? -1 // returns an optional
print(numofNissan)

if let numOfHonda = carDict[honda] {
    print(numOfHonda)
} else {
    print("there are no hondas")
}

// keys
let allCars = carDict.keys
for car in allCars {
    print(car.make)
}

// values
var gradesDict = ["a": 100, "b": 90, "c": 80]
let grades = gradesDict.values
print(grades)  // unordered

// first
let firstStudent = gradesDict.first! // returns tuple
print(firstStudent)

// randomElement
let randomStudent = gradesDict.randomElement()
print(randomStudent!)

//MARK:- ADDING KEYS AND VALUES

// update value
let newb = gradesDict.updateValue(95, forKey: "b")
print(newb!)
print(gradesDict)

let gradeD = gradesDict.updateValue(40, forKey: "d") // checks for key , update value if key exist, if key doesnt exsit add it to the dict
print(gradeD) // nil bc d didnt exist initially
print(gradesDict)

gradesDict["f"] = 0
print(gradesDict)

//MARK:- REMOVING KEYS AND VALUES

// filter
let filteredGrades = gradesDict.filter {$0.value > 80}
print(filteredGrades)

// removedValue
let removedValue = gradesDict.removeValue(forKey: "a")
print(removedValue)
print(gradesDict)

// removeall
gradesDict.removeAll()
print(gradesDict)

//MARK:-  COMPARING DICT

var dict1 = [2010: 2]
var dict2 = [2010: 2]
var dict3 = [2020: 1]
var dict4 = [2020: 2]

if dict2 == dict1 {
    print("same dates")
} else {
    print("not the same")
}

//MARK:- ITERATING

// for each
gradesDict = ["a": 100, "b": 90, "c": 80]

for (letter, grade) in gradesDict {
    print("The \(letter) is assigned \(grade)")
}

// enumurated
for (index, letter) in gradesDict.enumerated() {
    print("The \(letter.key) is at \(index) index")
}

//MARK:- FINDING ELEMENT
let gradeExist = gradesDict.contains { (letter, grade) -> Bool in
    return letter == "x" // must return a bool value
}

if gradeExist {
    print("yes grade exist")
} else {
    print("grade doesnt exist")
}

// first index
let index = gradesDict.firstIndex {$0.value == 100}
if let firstIndex = index {
    print(gradesDict[firstIndex].key)
}

// min & max
let maxElement = gradesDict.max {$0.value < $1.value}
print(maxElement)
print(gradesDict)

//MARK:- TRANSFORMING DICTIONARY

// map values
let numbersDict = [1: 2, 3: 4, 5: 6]
let valuesSquared = numbersDict.mapValues {$0 * $0}
print(valuesSquared)

// map((key, value) -> T) -> [T]
struct Person: Hashable {
    let name: String
    let age: Int
}

let personDict = ["Tsering": 25, "Yangzom": 16, "Alex": 45 ]

let people = personDict.map {Person(name: $0.key, age: $0.value)} // [Person]
people.forEach { print("\($0.name) is \($0.age)") }

// sorted
let sorted = personDict.sorted {$0.value > $1.value} // descending
print(sorted)

// compactmap - returns non nil values


//class Node {
//    var value: Int
//    var next: Node?
//
//    init(_ value: Int) {
//        self.value = value
//    }
//}
//
//func printNode(_ node: Node?) {
//    var node = node
//    while let currentNode = node {
//        print(currentNode.value)
//        node = currentNode.next
//    }
//}
//
//
//let nodeOne = Node(1)
//let nodeTwo = Node(2)
//let nodeThree = Node(3)
//
//nodeOne.next = nodeTwo
//nodeTwo.next = nodeThree
//
//func reverseList(_ node: Node?) -> Node? {
//    var currentNode = node
//    var previous: Node?
//    var next: Node?
//
//    while currentNode != nil {
//        next = currentNode?.next
//        currentNode?.next = previous
//        previous = currentNode
//        currentNode = next
//    }
//
//    return previous
//}
//
//printNode(reverseList(nodeOne))
