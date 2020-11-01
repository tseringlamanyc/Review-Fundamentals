import Foundation

//MARK:- ARRAY - collection of elements (homo, hetero)
var peopleNames = [String]()
var phoneNum = [Int]()

//MARK:- ARR WITH A DEFAULT VALUE
var newArray = Array(repeating: 0, count: 5)
print(newArray)

//MARK:- CREATING AN ARRAY BY ADDING 2 ARRAYS TOGETHER
var num1 = [1,2,3]
var num2 = [5,9,10]
let combinedArr = num1 + num2
print(combinedArr)

//MARK:- CREATING AN ARRAY LITERAL
var arrayLiteral = [true, false, true]
var arrayLiteral1 = ["a", "b", "c"]

//MARK:- MIXED ARRAY
var mixedArr: [Any] = [true,45, "Alex"]

//MARK:- ACCESSING ELEMENTS
// count
print(mixedArr.count) //3

// isEmpty
phoneNum.isEmpty
mixedArr.isEmpty

// subscript syntax
var languages = ["Swift", "Java", "C"]
languages[0]

// first - optional value
let first = arrayLiteral.first // safer than [0]
print(first ?? false)

// last

// randomElement
let randomValue = [1,3,4,5,6,7].randomElement()  // optional 
print(randomValue)


