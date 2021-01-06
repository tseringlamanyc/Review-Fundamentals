
import Foundation

// Type safe languague

var name = "Tsering"
// name = 41  - this is error (compiler error)

var isThursday = true  // var can be changed or mutated
isThursday = false

let pie = 3.14
// pie = 4.0 - cannot be changed or mutated (compiler error)

// TYPE INFERENCE
var year = "2020"  // automatically recognized by the compiler , (type inference)

// TYPE ANNOTATION
var emoji: Character = "😇"  // explicitly type annotate the character data type or else it will infer as string

// PRINTING
print("Swift")
print("The current year is \(year)")

// Integer bounds
var number = 56
let maxofInt = Int.max
let minofInt = Int.min

// FLOATING POINT NUMBER
let tacoPrice = 3.50 // double (infer)
// double is 64 bit (more storage), float is 32 bit

// BOOLEANS
var awesome = true
awesome = false

if awesome {
    print("yes")
} else {
    print("no")
}

// TUPLE
let person = (age: 25, occupation: "iOS Developer")
person.age
person.occupation

// OPTIONALS - may or may not have a value (nil)
var input = "45"
var convertInput = Int(input) // initializer - trying to create int from a string  ( optional int )

// OPTIONAL BINDING - unwraps optional value and stores in a var or const
if let validNumber = convertInput {
    print("valid number \(validNumber)")
} else {
    print("not valid number \(input)")
}

let validNumber = convertInput ?? -1
print(validNumber)


// MARK: - EXERCISES

var numOfSecInAYear = 0

numOfSecInAYear = 365 * (24 * (60 * 60))

123 % 10
50 / 7
