import UIKit

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
print(randomValue!)

// using subscript syntax to change a range of values
var contacts = ["Bob", "Adam", "Tsering", "Faker"]
contacts[1...3] = ["William", "BBK"]  // changed value from index 1...3 (override)
print(contacts)

//MARK:- COMPARING ARRAYS
[1, 2, 3] != [2, 3]
//[2, 3] == [1, 2]  // false

//MARK:- ADDING ELEMENTS
let combine = [1,2,3] + [1,2,3]
print(combine)

// append
contacts.append("Ann")   // adds to the end
print(contacts)

contacts.append(contentsOf: ["Zion", "Lebron"])  // adds to the end
print(contacts)

// insert
contacts.insert("Kobe", at: 1)
print(contacts)

//MARK:- REMOVING ELEMENTS
contacts.remove(at: contacts.count - 1)
contacts.removeLast() // crashes if the array is empty

// removeFirst, popLast(safer bc it removes an optional), removeAll, dropFirst, dropLast

var cities = ["nyc", "ktm"]
let citiesDropped = cities.dropFirst(5)  // dropLast removes from the back
print(citiesDropped)

//MARK:- ITERATING OVER AN ARRAY
cities = ["nyc", "ktm", "LA", "BK"]
for city in cities {
    print(city)
}

// accesing Index from an array
for (index, city) in cities.enumerated() {
    if city == "ktm" {
        print("city is \"ktm\" found at index: \(index)")
    }
}

//MARK:- FINDING ELEMENTS
cities.contains("nyc")

// firstIndex(of: )  - returns optional
if let index = cities.firstIndex(of: "ktm") {
    print("found city at index: \(index)")
} else {
    print("not found")
}

// lastIndex(of :) - same like first index

// min - optional
let ages = [1,100,4,7]
ages.min()

// max - optional
ages.max()

//MARK:- SELECTING ELEMENTS
let prefixAges = ages.prefix(3)
print(prefixAges) // returns the first 3 elements , doesnt remove

// suffix
let suffixAges = ages.suffix(2)
print(suffixAges)

//MARK:- TRANSFORMING AN ARRAY
// map
let numbers = [1,2,3,4,5]
let numSquared = numbers.map {$0 * $0}
print(numSquared)

// flatmap
let matrix = [[1,2], [3,4,5], [6,7,8,9]]
let flattenedArr = matrix.flatMap {$0}
print(flattenedArr)

// compactMap
var grades = [nil, 79, 99, nil, 0]
var onlyGrades = grades.compactMap {$0}
print(onlyGrades)

// reduce
let sum = onlyGrades.reduce(0,+) // +,-,*, /
print(sum)

// sort in place
onlyGrades.sort() // modifies current array (ascending by default)
print(onlyGrades) // sort in place

// sort(by: )
let sortedGrades = onlyGrades.sorted { $0 > $1} // desending (big to small)
// ascending { $0 < $1} (small to big)
print(sortedGrades)

// reverse
var someNum = [1,2,3,4,5]
print(someNum.reverse()) // reverse in place

// reversed() -> returns a new collection
let newReverse: [Int] = someNum.reversed()
print(newReverse)

// shuffle
(someNum.shuffle()) // shuffle in place
print(someNum)

// shuffled()
let shuffledElements = someNum.shuffled() // returns new collection
print(shuffledElements)

// swap at
var arrangedNum = [1,2,3,4,5]
arrangedNum.swapAt(0, 1)
print(arrangedNum)

// partition(by: )
var randomNum = [3,6,8,90,11,23]
let pivotIndex = randomNum.partition {$0 > 20}
print(randomNum) // partician in place ,, greater than 20 is to the right
print(pivotIndex)

let valLessthan20 = randomNum[..<pivotIndex]
let valMorethan20 = randomNum[pivotIndex...]

print(valMorethan20)
print(valLessthan20)

//MARK:- SPLITING AND JOINING AN ARRAY

// split()
let str = "NA is the worst region"
let strArr = str.split(separator: " ") // split everytime there is a space
print(strArr)

// joined()
let stringArr = ["Bob", "John", "Salley"]
let newStr = stringArr.joined(separator: ", ") // join elements with seperator 
print(newStr)
