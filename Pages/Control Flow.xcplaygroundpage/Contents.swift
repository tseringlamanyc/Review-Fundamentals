import Foundation

//MARK:- Control Flow - executing different branches of code or repeating block of code in the case of loops


//MARK:- FOR IN LOOPS

let names = ["Bob", "Tom", "Meh"]

for name in names {
    print(name)
}

let phoneBook = ["Alex": 911, "Sarah": 333, "Kim": 890]

for (name, number) in phoneBook {
    print("\(name)'s phone number is \(number)")
}

// Range

for num in 0...10 {  // including 10 (0..<10 -> not including 10 )
    print(num)
}


// stride
for num in stride(from: 10, through: 1, by: -1) {  // from 10 to 1
    print(num)
}

for num in stride(from: 5, to: 1, by: -1) {  // 5 to 2
    print(num)
}

//MARK:- WHILE LOOPS

var count = 10

while count >= 0 {
    print(count)
    count -= 1
}

//MARK:- REPEAT WHILE
var keepPlaying = false

repeat {
    print("currently playing")
} while keepPlaying


//MARK:- CONDITIONAL STATEMENTS

// if
var isWednesday = true

if isWednesday {
    print("its is wednesday")
}

// if else
isWednesday = false

if isWednesday {
    print("its wednesday")
} else {
    print("not wednesday")
}

//MARK:- SWITCH

let language = "Swift"

switch language {
case "Swift":
    print("iOS")
default:
    print("not iOS")
}

//MARK:- TUPLE IN SWITCHES

let coordinate = (40, 74)

switch coordinate {
case (40,74):
    print("in north")
case (40, _):
    print("at 40")
default:
    print("u lost")
}

//MARK:- VALUE BINDINGS
switch coordinate {
case (40, let lon):
    print("in north lon is \(lon)")
case (40, _):
    print("at 40")
default:
    print("u lost")
}


//MARK:- WHERE CLAUSE
let number = 10

switch number {
case 10 where number % 2 == 0 :  // 10 and even
    print("value is 10 and even")
default:
    print("not 10")
}


//MARK:- COMPOUND CASES
let char = "a"

switch char {
case "a", "b":  // a or b
    print("found char")
default:
    print("not found char")
}


//MARK:- CONTROL TRANSFER STATEMENTS

// continue
for num in 1...10 {
    if num % 2 == 0 { // even
        continue  // skips even num
    }
    print(num)
}

// break

for num in 1...10 {
    if num % 2 == 0 {
        break  // exits the for loop
    }
    print(num) // 1
}

// fallthrough

let grade = 87

switch grade {
case 0...65:
    print("C")
case 66...75:
    print("B-")
case 76...85:
    print("B")
case 86...90:
    print("B+")
    fallthrough // print next statement
default:
    print("missing a grade")
}

// return
// early exit using guard

func addNumbers(num: [Int]) -> Int {
    guard !num.isEmpty else {return 0}
    
    let results = num.reduce (0,+)
    return results
}

let arr: [Int] = []
let results = addNumbers(num: arr)
print(results)

// throw

enum AppError: Error {
    case badRequest
}

func fetchData() throws {
    throw AppError.badRequest
}

do {
try fetchData()
} catch {
    print(error)
}

// label statements

outerloop: for i in 0...5 {
    for j in 0...5 {
        if j == 4 {
            continue outerloop  // skips 4,5
        }
        print(i, j)
    }
}
