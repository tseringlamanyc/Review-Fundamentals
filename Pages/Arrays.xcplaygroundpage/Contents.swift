import UIKit

//MARK:- ARRAY - collection of elements (homo, hetero)
var peopleNames = [String]()
var phoneNum = [Int]()

var hello = "Hello"
hello.split(separator: ",")

for char in hello {
    print(char)
}

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
let citiesDropped = cities.dropFirst(1)  // dropLast removes from the back
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


var testString = "apple"
testString.removeLast()
print(testString)


// MARK: - EXERCISES
let ques1 = [ "orange", "red", "yellow", "turquoise", "lavender"]

var favColors = [String]()

for (index, color) in ques1.enumerated() {
    if index % 2 == 0 {
        favColors.append(color)
    }
}

print("\(favColors[0]), \(favColors[1]) and \(favColors[2]) are some of my fav colors")


var westernStates = ["California", "Oregon", "Washington", "Idaho", "Illinois", "Kansas"]
print(westernStates.dropLast(2))

let myString = "This is good practice with Strings!"
var nonSpaceCount = 0
for char in myString {
    if char != " " {
        nonSpaceCount += 1
    }
}
print(nonSpaceCount)

let myFavoriteQuotes = ["To be or not to be, that is the question.", "The only source of knowledge is experience.", "Mr. Gorbachev, tear down this wall!", "Four score and twenty years ago..."]

for quote in myFavoriteQuotes {
    var noSpaceCount = 0
    for str in quote {
        if str != " " {
            noSpaceCount += 1
        }
    }
    print(noSpaceCount)
}

var garden = ["dirt","🌷","dirt","🌷","dirt","dirt","🌷","dirt","🌷","dirt"]
var basket = [String]()

for (index, thing) in garden.enumerated() {
    if thing == "🌷" {
        basket.append(thing)
        garden[index] = "dirt" // override
    }
}

print(basket.count)
print(garden)

var battingLineup = ["Reyes", "Jeter", "Ramirez", "Pujols","Griffey","Thomas","Jones", "Rodriguez"]



for (index, batter) in battingLineup.enumerated() {
    if batter == "Jeter" {
        battingLineup[index] = "Tejada"
    }
    
    if batter == "Thomas" {
        battingLineup[index] = "Guerrero"
    }
}

if let reyesIndex = battingLineup.firstIndex(of: "Reyes") {
    battingLineup.remove(at: reyesIndex)
    battingLineup.insert("Reyes", at: 7)
}

battingLineup.append("Suzuki")
print(battingLineup)

var ques7 = [32459,2,4,5,1,4,2,1]
var target = 3
var foundTarget = false

for num in ques7 {
    if num == target {
        foundTarget = true
    }
}

print(foundTarget)

let arrayOfNumbers: [Int] = (1...100).map{ _ in Int.random(in: 0...200)}.map{Int($0)}  // 100 num in between 0 and 200

var largestNum = 0
var smallestNum = arrayOfNumbers[0]

for num in arrayOfNumbers {
    if num > largestNum {
        largestNum = num
    }
}

print(largestNum)

for num in arrayOfNumbers {
    if num < smallestNum {
        smallestNum = num
    }
}

print(smallestNum)

var listOne = [28, 64, 7, 96, 13, 32, 94, 11, 80, 68]
var listTwo = [18, 94, 48, 6, 42, 68, 79, 76, 13, 7]
var sharedElements = [Int]()

for num1 in listOne {
    for num2 in listTwo {
        if num2 == num1 {
            sharedElements.append(num2)
        }
    }
}

print(sharedElements)

var dupeFriendlyList = [4,2,6,2,2,6,4,9,2,1]
var noDupeList: [Int] = []

for num in dupeFriendlyList {
    if !noDupeList.contains(num) {
        noDupeList.append(num)
    }
}

print(noDupeList)

let arrayOfNumbers2 = [-6, 13, 0, 34, 0, 45, -12, 9, 11, 4]

var secondSmallest = Int.max
var smallest = Int.max

for num in arrayOfNumbers2 {
  if num < smallest {
    secondSmallest = smallest
    smallest = num
  } else if num < secondSmallest && num != smallest {
    secondSmallest = num
  }
}

print(smallest, secondSmallest)

var sum16 = 0

for num in 1..<1000 {
    if num % 3 == 0 || num % 5 == 0 {
        sum16 += num
    }
}

print(sum16)
