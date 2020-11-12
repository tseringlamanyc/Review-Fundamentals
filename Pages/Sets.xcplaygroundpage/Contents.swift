import Foundation

//MARK:- SET: A collection of unordered unique elements

//MARK:-  CREATING A SET

// literal
var numbers: Set = [1,2,3,4,5]

// generic
var genericSet: Set<String> = []

//MARK:- INSPECTING A SET

// isEmpty
if genericSet.isEmpty {
    print("set is empty")
}

// count
print(numbers.count)

//MARK:- TEST FOR MEMBERSHIP

// contains
if numbers.contains(3) {
    print("3 is in the set")
}

//MARK:- ADDING ELEMENTS

// insert
if genericSet.isEmpty {
    genericSet.insert("Alex")
}

print(genericSet)

// update:- To check if element existed before update. If nil then element before update didnt exist
var oldValue = genericSet.update(with: "Tsering")
print(oldValue)
print(genericSet)

oldValue = genericSet.update(with: "Alex")
print(oldValue)

//MARK:- REMOVING ELEMENTS

// filter
let filteredElements = numbers.filter {$0 > 3}
print(filteredElements)

// remove
let removedElement = numbers.remove(1)
print(removedElement)  // optional
print(numbers)

// removeFirst

struct Person: Hashable {
    let name: String
    let age: Int
}

let tsering = Person(name: "Tsering", age: 24)

var persons: Set = [tsering]  // unique value , not allow duplicates

// removeAt
print(numbers)

let index = numbers.firstIndex(of: 5) // optional

if let foundIndex = index {
    numbers.remove(at: foundIndex)
}

print(numbers)

// removeAll
numbers.removeAll()
print(numbers)

//MARK:- ITERATE THROUGH A SET

// for loop
var names: Set = ["alex", "Tsering", "Kim"]

for name in names {
    print(name)
}

// enumurated
for (index, name) in names.enumerated() {
    print("\(name) is at index \(index)")
}

// for each
names.forEach { print($0) }

//MARK:- COMBINING SETS

// union

let set1: Set = [1,2,3,4,5]
let set2: Set = [4,5,6,7,8,9]
let union = set1.union(set2)  // combines set1 and set2

print(union)  // unordered

// intersection - common elements
let intersection = set1.intersection(set2)
print(intersection)

// symmetric difference - element unique to each set
let difference = set1.symmetricDifference(set2)
print(difference)

// subtracting
let subtractingResult = set1.subtracting(set2)
print(subtractingResult)

//MARK:- COMPARING SETS

// equals
if set1 == set2 {
    print("sets are equal")
} else if set1 != set2 {
    print("sets are not equal")
}

let charSet1: Set<Character> = ["a", "b", "c"]
let charSet2: Set<Character> = ["a", "b", "c", "d", "e", "f"]

// isSubset
charSet1.isSubset(of: charSet2)  // all element of charSet1 is in charSet2
charSet2.isSubset(of: charSet1)

// isStrictSubset
charSet1.isStrictSubset(of: charSet2)  // cannot compare to itself

// superSet
charSet2.isSuperset(of: charSet1)  // charSet2 has all the elements of charSet1

// isStrictSuperSet
charSet2.isStrictSuperset(of: charSet1)

// isDisjoint
let unique1: Set = [1,2,3,4]
let unique2: Set = [5,6,7]

unique1.isDisjoint(with: unique2)  // no elements in common between two sets


//MARK:- COMMON FUNCTIONS

// filter, map, min , max   etc.....
