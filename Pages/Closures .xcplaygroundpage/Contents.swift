import Foundation

// Closures
// 1. Blocks of code that can be passed around like variables
// 2. Captures references of its surrounding context, closures are reference types

// review variable initialization
var name: String = "Alex"

print(name)

// Closure syntax definition
// this closure does not take arguments and does not return and type
var closure: () -> () = {
  print("Closure executed.")
}


// func yup(word: String, closure: () -> ()) {
// }

closure()

// Closures as function parameters and Trailing closure syntax
// as of Swift 5.3 we now have multiple trailing closures
func greeting(_ name: String, action: () -> ()) { // action is a non-escaping closure
  print("Hello \(name)")
  action()
}

greeting("Bob") { // using trailing closure syntax
  print("Name has been printed")
}


// Closures as optional function parameters
func action(_ title: String, closure: (() -> ())? = nil) { // closure non-escaping
  print("The title of the action is \(title)")
  closure?()
}

action("Learning about closures.") { // no arguments
  print("action is complete")
}


// @escaping closures
class BlackJack {
  // defined a closure called gameScore
  // gameScore is an @escaping closure
  // if we use a closure as a variable in an object we have to mark it @escaping
  private var gameScore: (Int) -> () // gameScore captures an Int value

  init(gameScore: @escaping (Int) -> ()) {
    self.gameScore = gameScore
    play()
  }

  func play() {
    gameScore(Int.random(in: 18...21))
  }
}

let blackJack = BlackJack { score in
  print("Score is \(score)")
}


// Shorthand syntax
func operation(_ a: Int, _ b: Int, action: (Int, Int) -> ()) {
  action(a, b) // action is capturing value a and value b
}

operation(5, 4) { value1, value2 in // using trailing closure syntax
  print("adding values together equals \(value1 + value2)")
}

operation(10, 5) { print($0 * $1) } // using Shorthand closure syntax

// Closures with arguments
let isEven: (Int) -> Bool = { $0 % 2 == 0 } // implicit return in closures

print(isEven(10)) // true


// Closures as return types
let add: (Int, Int) -> Int = { $0 + $1 }
let subtract: (Int, Int) -> Int = { $0 - $1 }

func randomOperation() -> (Int, Int) -> Int {
  let operations = [add, subtract]
  return operations.randomElement() ?? add
}

let operation = randomOperation()  // operation is a closure, (Int, Int) -> Int
print(operation(5, 8)) // add or subract closure



// Built-in closures - map, filter, reduce, sorted, compactMap

// a higher order function is a function that takes another function or returns a function


// map - transforms each element in a collection and returns the resulting array

let mapArr = [1, 2, 3, 4]
let squareResults = mapArr.map { $0 * $0 }
print(squareResults)


// filter - returns an array of filtered results based on a given condition (predicate)
let filterArr = [1, 2, 3, 4, 5, 6, 7]
let filteredResults = filterArr.filter { $0 > 4 } // (Int) -> Bool
print(filteredResults)

// reduce - combines values given a closure
let values = [1, 2, 10]
let sum = values.reduce(0, +)
print(sum)

// sorted
let chars: [Character] = ["z", "a", "d"]
let sortedChars = chars.sorted { $0 > $1 } // < is ascending order, > is descending order
print(sortedChars)


// compactMap - remove nil values
let grades = ["89", "90", "ninety", "75", "eighty"] // [String]
let validGrades = grades.compactMap { Int($0) } // Int(String) is a failable initialier
print(validGrades)

// Chaining closures
let result = [1, nil, 5].compactMap { $0 }
                        .map { $0 * $0 }
                        .reduce(0, +)
print(result) // 26


// Challenge: Rewrite the built-in filter function
func customFilter<T>(_ elements: [T], filter: (T) -> (Bool)) -> [T] {
  var filteredResults = [T]()
  for element in elements {
    if filter(element) { // if bool is true
      filteredResults.append(element)
    }
  }
  return filteredResults
}

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let evenNubmers = customFilter(numbers) { $0 % 2 == 0 }

let xyz = customFilter(numbers) { (num) -> (Bool) in
    num % 2 == 0
}

print(xyz)

print(evenNubmers)

let moreChars: [Character] = ["a", "b", "a", "a"]
let letterAs = customFilter(moreChars) { $0 == "a" }
print(letterAs)


// MARK:- EXERCISES
func applyKTimes(_ K: Int, closure: () -> ()) {
    for _ in 1...K {
        closure()
    }
}

var myVal = 0
applyKTimes(5) {
  myVal += 1
}

print(myVal)

func largestValue(_ number: [Int]) -> Int {
    guard let first = number.first else {return -100}
    
    let largest = number.reduce(first) { (previous, current) -> Int in
        print(previous, current)
        if previous > current {
            return previous
        }
        return current
    }
    return largest
}

let moreNumbers = [4, 7, 1, 9, 6, 5, 6, 9]

largestValue(moreNumbers)


func multiples(_ of: Int, _ numbers: [Int]) -> [Int] {
    numbers.filter { $0 % of == 0 }
}

let numbers1 = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]
multiples(3, numbers)


func sortedNamesByLastName(in names: [(String, String)]) -> [(String, String)] {
    return names.sorted { $0.1 < $1.1 } // ascending
}

let firstAndLastTuples = [
    ("Johann S.", "Bach"),
    ("Claudio", "Monteverdi"),
    ("Duke", "Ellington"),
    ("W. A.", "Mozart"),
    ("Nicolai","Rimsky-Korsakov"),
    ("Scott","Joplin"),
    ("Josquin","Des Prez")
]

sortedNamesByLastName(in: firstAndLastTuples)


func sumOfSquaresOfOddNumbers(in numbers: [Int]) -> Int {
    return numbers.filter { $0 % 2 != 0 }.map { $0 * $0}.reduce (0,+)
}

let evenMoreNumbers = [1, 2, 3, 4, 5, 6]
sumOfSquaresOfOddNumbers(in: evenMoreNumbers)

func mapFunction<T>(_ numbers: [T], map: (T) -> (T)) -> [T] {
    var array = [T]()
    
    for num in numbers {
        array.append(map(num))
    }
    
    return array
}

mapFunction([1,2,3,4]) { (num) -> (Int) in
    return num * num // map
}

let allNames = ["ALEX", "KIM", "SAM", "TOM", "RACHEL"]

print(mapFunction([1,2,3,4]) { $0 * $0})
print(mapFunction(allNames, map: { (name) -> (String) in
    return name.lowercased()
}))
