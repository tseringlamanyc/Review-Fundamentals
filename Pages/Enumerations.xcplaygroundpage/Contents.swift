import Foundation

// Enumerations - a group of finite related values, if not finite we have to
//                use a default statement


// enum syntax

enum SoftwarePlatform {
    case web
    case iOS
    case android
}


// Creating an instance of an enum
let platform = SoftwarePlatform.android // an instance of the SoftwarePlatform enum


// Using a Switch statement on an enum instance

switch platform {
case .iOS:
    print("You're an iOS developer.")
case .android:
    print("You're an android developer.")
case .web:
    print("You're a web developer.")
}

// Iterating over an enum

enum Season: CaseIterable { // CaseIterable protocol
    case winter, spring, summer, fall
}

for season in Season.allCases {
    print(season)
}

print("There are \(Season.allCases.count) seasons.")


// Associated values

enum Language {
    case swift(String, Double) // plaform, version
    case java(String, Bool)
    case objectiveC(String)
}

let language = Language.swift("macOS", 5.3)

switch language {
case .swift(let platform, let version):
    print("Looks like you're an \(platform) developer running Swift \(version) on Xcode 12.3.")
default:
    print("Other language.")
}


// Raw values

enum UserState: String {
    case newUser = "Welcome to our awesome app."
    case existingUser = "Continue from where you left off, good luck."
}

let user = UserState.existingUser

print(user.rawValue)


// Implicitly assigned raw values

enum DaysOfTheWeek: Int { // default start value of an Int is 0
    case monday = 1, tuesday, wednesday, thursday, friday, saturday, sunday
    // increments by 1
    // 1...7
    // if less than 1 or greater than 7 day is invalid
}

let day = DaysOfTheWeek.tuesday

print(day.rawValue) // 2


// Initializing from a raw value

let newDay = DaysOfTheWeek(rawValue: 3) // 1...7

if let existingDay = newDay {
    print("Existing day is \(existingDay) and raw value is \(existingDay.rawValue)")
} else {
    print("Day does not exist.")
}

enum CovidVaccine: String { // raw value of type String
    // cases
    case pfizer = "Pfizer"
    case moderna = "Moderna"
    case astraZeneca = "AstraZeneca"
    case janssens = "Janssens"
    case novavax = "Novavax"
    
    // properties
    
    static var updates: String { // type property e.g CovidVaccine.updates
        return "As of December 28, 2020, large-scale (Phase 3) clinical trials are in progress or being planned for three COVID-19 vaccines in the United States \(CovidVaccine.astraZeneca.name), \(CovidVaccine.janssens.name) and \(CovidVaccine.novavax.name)"
    }
    
    var name: String { // computed property
        return self.rawValue
    }
    
    var numberOfShots: (shot: Int, days: Int) {
        switch self {
        case .pfizer:
            return (2, 21)
        case .moderna:
            return (2, 28) // 28 days between the first and second shot
        default:
            return (-1, -1)
        }
    }
    
    // methods
    func info() {
        switch self { // self represents the enum instance
        case .pfizer, .moderna:
            print("\(name) is authorized and recommended by the CDC.")
        default:
            print("\(name) is in Phase 3 Clinical Trials.")
        }
    }
}

// create an instance of CovidVaccine

let vaccine = CovidVaccine.moderna

vaccine.info()

print(vaccine.numberOfShots)

// type property
print(CovidVaccine.updates)


//MARK:- EXERCISE
enum Coin: Int {
    case penny = 1
    case nickle = 5
    case dime = 10
    case quarter = 25
}

let coinArr: [(Int, Coin)] = [(10, .penny),
                              (15, .nickle),
                              (3, .quarter),
                              (20, .penny),
                              (3, .dime),
                              (7, .quarter)]


func getTotalValue(from: [(number: Int, coin: Coin)]) -> Int {
    
    var total = 0
    
    return total
}

let total = getTotalValue(from: coinArr)
