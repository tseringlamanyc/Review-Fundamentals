import Foundation


/*
 Closures are self-contained blocks of functionality that can be passed around and used in your code.
 Closures can capture and store references to any constants and variables from the context in which they’re defined.
 */


//MARK:- SIMPLEST CLOSURES
func sayHello() {
    print("Hello Closure")
}

let sayHelloClosure = {
    print("Hello Closure")
}

sayHelloClosure()

//MARK:- CLOSURES WITH PARAMETERS
func sayHello1(name: String) {
    print("Hello \(name)")
}

sayHello1(name: "Tsering")

let sayHelloClosure1: (String) -> () = { (name) in
    print("Hello \(name)")
}

sayHelloClosure1("Tsering")

//MARK:- CLOSURES THAT RETURNS
func sum(a: Int, b: Int) -> Int {
    a + b
}

let sumClosure = { (a: Int, b: Int) in
    return a + b
}

sumClosure(9, 10)

//MARK:- CLOSURES AS FUNCTION PARAMETERS
func saySomething(to: String, something: (String) -> ()) {
    let newName = to.uppercased()
    something(newName)
}

// inline closure
saySomething(to: "Tsering") { name in
    print("Hello \(name)")
}

let reallySomething: (String) -> () = { name in
    print("Hello \(name)")
}

saySomething(to: "Kobe Bryant", something: reallySomething)

//MARK:- ESCAPING CLOSURES
func espacingClosure(to: String, something: @escaping (String) -> ()) {
    let newName = to.uppercased()
    
    // closure wont be excuted until 3 seconds are passed
    // dispatch is holding to our closure until 3 seconds are up
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        something(newName)
    }
}

espacingClosure(to: "Melo") { name in
    print("sup \(name)")
}

//MARK:- RETURN A CLOSURES
func sayIt() -> (String) -> () {
    return { string in
        print("Return \(string)")
    }
}

// sayIt()("Whats up")
let greetings = sayIt()
greetings("Whats up")

//MARK:- CAPTURING VALUES IN CLOSURES
func counter() -> () -> () {
    var count = 1
    return {
        print("The count is \(count)")
        count += 1
    }
}

let gameCounter = counter()

// reference types
gameCounter()

// already captured the value from the previous call
gameCounter()
