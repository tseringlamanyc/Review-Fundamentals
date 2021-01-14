import Foundation

//MARK: - EXERCISES

struct Alien {
    var name: String
    var height: Double
    var homePlanet: String
}

var bilbo = Alien(name: "Bilbo", height: 1.67, homePlanet: "Venus") // inorder to change this needs to be a var and not a let

bilbo.name = "Jake"
bilbo.height = 1.42
bilbo.homePlanet = "Saturn"

print(bilbo)

var charles = Alien(name: "Charles", height: 2.25, homePlanet: "Pluto")
var charlesFromJupiter = charles
charlesFromJupiter.homePlanet = "Jupiter" // value type has it own copy w/o affecting the original
charles.homePlanet // Pluto

struct BankAccount {
    var owner: String
    var balance: Double
    
    mutating func deposit(_ amount: Double) {  // bc its immutable by default
        balance += amount
    }
    
    mutating func withdraw(_ amount: Double) {
        balance -= amount
    }
}

var joeAccount = BankAccount(owner: "Joe", balance: 100.0)
var joeOtherAccount = joeAccount
joeAccount.withdraw(50.0)
joeAccount.balance // 50
joeOtherAccount.balance // 100


struct Person {
    var firstName: String
    var lastName: String
    var middleName: String?
    
    var fullName: String {
        return "\(firstName) \(middleName ?? "") \(lastName)"
    }
}

let yangzom = Person(firstName: "Yangzom", lastName: "Lama", middleName: nil)
let tsering = Person(firstName: "Tsering", lastName: "Lama", middleName: "Lhakpa")

yangzom.firstName
tsering.firstName

print(tsering.fullName)
yangzom.fullName

struct Book {
    var title, author: String
    var rating: Double
    
    var isGood: Bool {
        return rating >= 7 ? true : false
    }
}

let cantHurtMe = Book(title: "Can't Hurt Me", author: "David Goggins", rating: 10.0)
cantHurtMe.isGood

struct FreezingPoint {
    static let celsius: Double = 0
    static let fahrenheit: Double = 1.8 * celsius + 32
    static let kelvin: Double = celsius + 273
}

struct Celsius {
    var celcius: Double
    
    mutating func getF() -> Double  {
        return 1.8 * celcius + 32
    }
    
    mutating func getK() -> Double {
        return celcius + 273
    }
}

var tenDegreesCelsius = Celsius(celcius: 10.0)
print(tenDegreesCelsius.celcius) //returns 10.0
print(tenDegreesCelsius.getK()) //returns 283.0
print(tenDegreesCelsius.getF()) //returns 50.0 //returns 50.0

struct RGBColor {
    var red, green, blue: Double
}

let colorDictArray: [[String: Double]] = [["red": 1.0, "green": 0.0, "blue": 0.0],
                                          ["red": 0.0, "green": 1.0, "blue": 0.0],
                                          ["red": 0.0, "green": 0.0, "blue": 1.0],
                                          ["red": 0.6, "green": 0.9, "blue": 0.0],
                                          ["red": 0.2, "green": 0.2, "blue": 0.5],
                                          ["red": 0.5, "green": 0.1, "blue": 0.9],]

var colorArr = [RGBColor]()

for colors in colorDictArray {
    colorArr.append(RGBColor(red: colors["red"]!, green: colors["green"]!, blue: colors["blue"]!))
}

print(colorArr.count)
print(colorArr.first?.red ?? 0.0)
print(colorArr.last?.blue ?? 0.0)

struct Movie {
    var name, genre, description: String
    var year: Int
    var cast: [String]
}

extension Movie: CustomStringConvertible {
    
    var Moviedescription: String {
        return "\(name) is a \(genre) released in \(year) with the following cast members: \(cast.joined(separator: " ,"))"
    }
}

func makeMovie(movie: [String: Any]) -> Movie? {
    
    guard let name = movie["name"] as? String,
          let genre = movie["genre"] as? String,
          let year = movie["year"] as? Int,
          let description = movie["description"] as? String,
          let cast = movie["cast"] as? [String] else {
        return nil
    }
    
    return Movie(name: name, genre: genre, description: description, year: year, cast: cast)
    
}

let dieHardDict: [String: Any] = ["name": "Die Hard",
                                  "year" : 1987,
                                  "genre": "action",
                                  "cast": ["Bruce Willis", "Alan Rickman"],
                                  "description": "John Mclain saves the day!"]

let dieHardMovie = makeMovie(movie: dieHardDict)
print(dieHardMovie?.Moviedescription ?? "")

let theBanker = Movie(name: "The Banker", genre: "Drama", description: "Yes", year: 2020, cast: ["Anthony Markie", "Samuel L. Jackson", "Nicholas Hoult", "Nia Long"])
print(theBanker.Moviedescription)

var moviesArray: [[String:Any]] = [
    [
        "name": "Minions",
        "year": 2015,
        "genre": "animation",
        "cast": ["Sandra Bullock", "Jon Hamm", "Michael Keaton"],
        "description": "Evolving from single-celled yellow organisms at the dawn of time, Minions live to serve, but find themselves working for a continual series of unsuccessful masters, from T. Rex to Napoleon. Without a master to grovel for, the Minions fall into a deep depression. But one minion, Kevin, has a plan."
    ],
    [
        "name": "Shrek",
        "year": 2001,
        "genre": "animation",
        "cast": ["Mike Myers", "Eddie Murphy", "Cameron Diaz"],
        "description": "Once upon a time, in a far away swamp, there lived an ogre named Shrek whose precious solitude is suddenly shattered by an invasion of annoying fairy tale characters. They were all banished from their kingdom by the evil Lord Farquaad. Determined to save their home -- not to mention his -- Shrek cuts a deal with Farquaad and sets out to rescue Princess Fiona to be Farquaad\"s bride. Rescuing the Princess may be small compared to her deep, dark secret."
    ],
    [
        "name": "Zootopia",
        "year": 2016,
        "genre": "animation",
        "cast": ["Ginnifer Goodwin", "Jason Bateman", "Idris Elba"],
        "description": "From the largest elephant to the smallest shrew, the city of Zootopia is a mammal metropolis where various animals live and thrive. When Judy Hopps becomes the first rabbit to join the police force, she quickly learns how tough it is to enforce the law."
    ],
    [
        "name": "Avatar",
        "year": 2009,
        "genre": "action",
        "cast": ["Sam Worthington", "Zoe Saldana", "Sigourney Weaver"],
        "description": "On the lush alien world of Pandora live the Na\"vi, beings who appear primitive but are highly evolved. Because the planet\"s environment is poisonous, human/Na\"vi hybrids, called Avatars, must link to human minds to allow for free movement on Pandora. Jake Sully, a paralyzed former Marine, becomes mobile again through one such Avatar and falls in love with a Na\"vi woman. As a bond with her grows, he is drawn into a battle for the survival of her world."
    ],
    [
        "name": "The Dark Knight",
        "year": 2008,
        "genre": "action",
        "cast": ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
        "description": "With the help of allies Lt. Jim Gordon and DA Harvey Dent, Batman has been able to keep a tight lid on crime in Gotham City. But when a vile young criminal calling himself the Joker suddenly throws the town into chaos, the caped Crusader begins to tread a fine line between heroism and vigilantism."
    ],
    [
        "name": "Transformers",
        "year": 2007,
        "genre": "action",
        "cast": ["Shia LaBeouf", "Megan Fox", "Josh Duhamel"],
        "description": "The fate of humanity is at stake when two races of robots, the good Autobots and the villainous Decepticons, bring their war to Earth. The robots have the ability to change into different mechanical objects as they seek the key to ultimate power. Only a human youth, Sam Witwicky can save the world from total destruction."
    ],
    [
        "name": "Titanic",
        "year": 1997,
        "genre": "drama",
        "cast": ["Leonardo DiCaprio", "Kate Winslet", "Billy Zane"],
        "description": "The ill-fated maiden voyage of the R.M.S. Titanic; the pride and joy of the White Star Line and, at the time, the largest moving object ever built. She was the most luxurious liner of her era -- the \"ship of dreams\" -- which ultimately carried over 1,500 people to their death in the ice cold waters of the North Atlantic in the early hours of April 15, 1912."
    ],
    [
        "name": "The Hunger Games",
        "year": 2012,
        "genre": "drama",
        "cast": ["Jennifer Lawrence", "Josh Hutcherson", "Liam Hemsworth"],
        "description": "Katniss Everdeen voluntarily takes her younger sister\"s place in the Hunger Games, a televised competition in which two teenagers from each of the twelve Districts of Panem are chosen at random to fight to the death."
    ],
    [
        "name": "American Sniper",
        "year": 2014,
        "genre": "drama",
        "cast": ["Bradley Cooper", "Sienna Miller", "Kyle Gallner"],
        "description": "Navy S.E.A.L. sniper Chris Kyle\"s pinpoint accuracy saves countless lives on the battlefield and turns him into a legend. Back home to his wife and kids after four tours of duty, however, Chris finds that it is the war he can\"t leave behind."
    ]
]

let allMovies = moviesArray.compactMap(makeMovie(movie:))
print(allMovies.count) // 9

print(allMovies.first?.name ?? "") // Minions
print(allMovies.last?.name ?? "")

struct Room {
    var maxOccupancy: Int
    var length: Double
    var width: Double
}

let newRoom = Room(maxOccupancy: 10, length: 10, width: 10)
var myRoom = newRoom
myRoom.maxOccupancy = 100

print(newRoom.maxOccupancy) // copy , wont change the value of the original


struct Point {
    
  let x: Double
  let y: Double
    
   func distance(to point: Point) -> Double {
    //Code in your answer here
    let horizontalDistance = self.x - point.x
    let verticalDistance = self.y - point.y
    let distanceBetweenTwoPoints = sqrt(horizontalDistance * horizontalDistance + verticalDistance * verticalDistance)
    
    return distanceBetweenTwoPoints
  }
}

//
//let pointOne = Point(x: 0, y: 0)
//let pointTwo = Point(x: 10, y: 10)
//
//print(pointOne.distance(to: pointTwo))

struct Circle {
    
  let radius: Double
  let center: Point
    
    func contains(_ point: Point) -> Bool {
        let distanceFromOrigin = center.distance(to: point)
        return distanceFromOrigin <= radius // distance from origin has to less than radius
    }
    
    func randomPoint() -> Point {
        let xValue = Double.random(in: -radius...radius)
        let yValue = sqrt((radius * radius) - (xValue * xValue))
        return Point(x: xValue, y: yValue)
    }
}

let pointOne = Point(x: 0, y: 0)
let circleOne = Circle(radius: 5, center: pointOne)
let pointTwo = Point(x: 5, y: 0)
let pointThree = Point(x: 6, y: 0)
let pointFour = Point(x: sqrt(12.5), y: sqrt(12.5))
circleOne.contains(pointTwo) //true
circleOne.contains(pointThree) // false
circleOne.contains(pointFour) //true

print(circleOne.contains(circleOne.randomPoint()))


struct Hangman {
    
    var targetWord: String = ""
    var numberOfIncorrectGuess: Int = 0
    var guessedLetters: [Character] = []
    
    func playerWon() -> Bool {
        
        var targetArr = Array(targetWord)
        let setChar = Set(guessedLetters)
        
        for (_, char) in targetArr.enumerated() {
            if setChar.contains(char) {
                if let firstIndex = targetArr.firstIndex(of: char) {
                    targetArr.remove(at: firstIndex)
                }
            }
        }
        return targetArr.isEmpty
    }
    
//    func printDisplayVersionOfWord(target: String, guessedLetters: Character) -> String {
//
//        var targetArr = [target]
//        var missingLetters = ""
//
//        for (index, char) in targetArr.enumerated() {
//            if Character(char) == guessedLetters {
//                targetArr.remove(at: index)
//            }
//        }
//
//        return missingLetters
//    }
    
}

var model = Hangman()
model.targetWord = "hello" // ["h,"e","l","l",o"]
model.guessedLetters = ["h", "e", "l", "o"]
model.playerWon()
