import Foundation

// functions: self contained blocks of code that perform a specific task

// defining a function

/*
 func keyword
 function name
 parameter list ()
 function body {}
 
 function call e.g welcomeGreeting()
 */

func welcomeGreeting() { // defined the function
    // body of function
    print("Welcome to functions in Swift.")
}

welcomeGreeting() // we called the function does not take arguments

// function parameters and return values
// input: String
// output: String
func add(lastName: String) -> String {
    return "Your last name is \(lastName)"
}

// call the add function
let result = add(lastName: "Appleseed")
print(result)

// functions with multiple parameters
func add(number1: Int, number2: Int) -> Int {
    return number1 + number2
}
let result2 = add(number1: 5, number2: 10)
print(result2)

// functions without return values
func popularProgrammingLanguage(language: String) {
    print("Popular language is \(language)")
}

popularProgrammingLanguage(language: "Swift")


// functions with multiple return values
func getCoordinate() -> (latitude: Double, longitude: Double) {
    return (40.3, 73.5)
}

let coordinate = getCoordinate()
print(coordinate.longitude)

// function with implicit return
func multiply(num1: Int, num2: Int) -> Int {
    //num1 * num2 - not support in this version on repl
    return num1 * num2
}

let result3 = multiply(num1: 10, num2: 8)
print(result3)

// function argument labels and parameter names
func getFirstName(for person: String) -> String {
    let name = person.split(separator: " ")
    return String(name[0])
}

let firstName = getFirstName(for: "Alex Paul") // => "Alex" "Paul"
print(firstName)

// omitting argument labels
func square(_ num: Int) -> Int {
    //num * num // implicit return - not supported in this version of repl
    return num * num // implicit return
}

let result4 = square(9)

// default parameter values
func getCoffee(sugar: Int = 1) {
    print("Here's your coffee, \(sugar) sugar was added.")
}

getCoffee() // will use a default argument
getCoffee(sugar: 3)

// variadic parameters (can add any amount of the parameters)
func sum(_ values: Int...) {
    let result = values.reduce(0, +)
    print("The sum of values is \(result)")
}

sum(5, 10, 2, 10)

// in-out parameters
func change(name: inout String) {
    // by default parameters in a function are constants
    // cannot be changed
    name = "John Appleseed"
    // name here is locally scoped to the change() function
}

var personName = "Tim Cook"

change(name: &personName)

print(personName)

//MARK:- EXERCISE

func secondSmallest(of numbers: [Int]) -> Int {
  guard var smallest = numbers.first else { return 0 }
  var secondSmallest = Int.max
    
  for num in numbers {
    if num < smallest {
      secondSmallest = smallest
      smallest = num
    }
    else if num < secondSmallest && num != smallest {
      secondSmallest = num
    }
  }
  return secondSmallest
    
}


func fizzBuzz(n: Int) -> String {
    
    var arr = [String]()
    
    for num in 1...n {
        if num % 15 == 0 {
            arr.append("Fizz Buzz")
        } else if num % 3 == 0 {
            arr.append("Fizz")
        } else if num % 5 == 0 {
            arr.append("Buzz")
        } else {
            arr.append(num.description)
        }
    }
    
    return arr.description
}

fizzBuzz(n: 15)
