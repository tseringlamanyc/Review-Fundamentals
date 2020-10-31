import UIKit

//MARK:- ASSIGNMENT OPERATOR
var a = 34 // original
a = 10 // reassign a var
print(a)

//MARK:- ARITHIMETIC OPERATORS
var addition = 56 + 4
print("This is addition value \(addition)")

var subtraction = 65 - 5
print("This is subtraction value \(subtraction)")

var multipication = 10 * 10
print("This is multiplication value \(multipication)")

var division = 20 / 5  // will infere , type inference 
print("This is the division value \(division)")

//MARK:- REMAINDER OR MODULO OPERATOR
var remainder = 9 % 4
print("remainder is \(remainder)")

//MARK:- URARY MINUS AND PLUS OPERATOR
var positiveNumber = +10

var negativeNumber = -4
print("\(positiveNumber) + \(negativeNumber) is \(positiveNumber + negativeNumber)")

//MARK:- COMPOUND ASSIGNMENT
var compoundNumber = 20
compoundNumber = compoundNumber + 1  // first does the right side of the equation
print(compoundNumber)

compoundNumber += 1
print(compoundNumber)

compoundNumber -= 10
print(compoundNumber)

// MARK:- COMPARISON OPERATOR
var x = 5
var y = 10

print(x == x)  // true
print(y > x)  // true
print(y < x)  // false
print(x == y)  // false
print(x >= x)  // true
print(x != y)  // true

//MARK:- TERNIARY OPERATOR
var resultOfTernaryOperation = 100

if resultOfTernaryOperation > 80 {
    print("Number is greater than 80")
} else {
    print("number is less than 80")
}

let message = resultOfTernaryOperation > 80 ? "Number is greater than 80" : "Number is less than 80"
print(message)

//MARK:- NIL-COALESCING OPERATOR (??)
var inputUser = "56"
var converInput = Int(inputUser) ?? 0

//MARK:- RANGES
// closed range
for num in 0...4 {
    print(num, terminator: " ")
}

print()

// half - open
for num in 0..<4 {
    print(num, terminator: " ")
}

print()

// one sided range
let arr = [1,2,3,4,5,6,7]
print(arr)
print(arr[...2]) // index until 2
print(arr[4...]) // index 4 until end

//MARK:- LOGICAL OPERATOR
if 5 < 7 && 4 > 2 {
    print("true statement")
} else {
    print("false statement")
}

// T && T = T
// T && F = F
// F && F = T

if 5 < 7 || 4 < 2 {  // or operator
    print("true")
} else {
    print("false")
}

var isFriday = true
if !isFriday { // not operator 
    print("TGIF")
} else {
    print("NOT TGIF")
}
