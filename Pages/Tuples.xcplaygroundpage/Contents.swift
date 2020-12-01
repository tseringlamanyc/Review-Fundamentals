import Foundation 

//MARK:- TUPLES - Comma seperated list of types (Int, Bool)

//MARK:- Variable or constants

let fullName = ("Tsering", "Lama")
print("First name is \(fullName.0), last name is \(fullName.1)")

//MARK:- Return types

func blackJack() -> (Int, Bool, String) {
    let score = Int.random(in: 18...21)
    
    if score == 21 {
        return (score, true, "Blackjack!!!!")
    } else {
        return (score, false, "try again")
    }
}

print(blackJack())

//MARK:- Switches

let coordinate =  (40.71, 74.00)

switch coordinate {
case (39..., _):
    print("approaching new york")
default:
    print("not close yet")
}


//MARK:- Labels on tuples

var date: (month: String, day: Int) = ("November", 27)

print("Today is \(date.month) \(date.day)")
