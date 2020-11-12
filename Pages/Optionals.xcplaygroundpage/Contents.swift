import Foundation

//MARK:- OPTIONALS - A type in swift that says there could exist a value or not on an object

var dict = [String: String]()

//MARK:- FORCE WRAPP
dict["Tsering"] = "Lama"

let lastName = dict["Tsering"]! // force wrapp
print(lastName)

// let otherLastName = dict["TSM"]!  FATAL ERROR , TSM doesnt exist in the dict

//MARK:- IMPLICITLY UNWRAPPED OPTIONALS
var name: String!  // no need to unwrapp later

name = "Bob"

let unwrappedName: String = name
print(unwrappedName)

//MARK:- NIL COELESCING
let otherLastName = dict["TSM"] ?? "wack"  // default value if value doesnt exist
print(otherLastName)

//MARK:- OPTIONAL BINDING (if let, if var)

if let lastName = dict["Tsering"] { // bins value to lastname
    print(lastName)
} else {
    print("no lastName")
}

//MARK:- GUARD
func printName(string: String?) {
    guard let string = string else {
        print("no name given")
        return // exist the function
    }
    
    print(string)
    
}

printName(string: nil)

//MARK:- WHILE LET
// abstract data structure

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

func printNode(node: Node?) {
    var node = node
    while let currentNode = node {
        print(currentNode.value)
        node = currentNode.next
    }
}

//MARK:- OPTIONAL CHAINING

var userName: String?
var password: String?

userName = "Tsering"

if let username = userName,
   let password = password {
    print("user entered both values")
} else {
    print("values are missing")
}

