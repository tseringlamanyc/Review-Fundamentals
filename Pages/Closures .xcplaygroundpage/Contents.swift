import Foundation 

func applyKTimes(_ K: Int, closure: () -> ()) {
    for _ in 1...K {
        closure()
    }
}

var myVal = 0
applyKTimes(5) {
  myVal += 1
}

print(myVal)

func largestValue(_ number: [Int]) -> Int {
    guard let first = number.first else {return -100}
    
    let largest = number.reduce(first) { (previous, current) -> Int in
        print(previous, current)
        if previous > current {
            return previous
        }
        return current
    }
    return largest
}

let moreNumbers = [4, 7, 1, 9, 6, 5, 6, 9]

largestValue(moreNumbers)


func multiples(_ of: Int, _ numbers: [Int]) -> [Int] {
    numbers.filter { $0 % of == 0 }
}

let numbers = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]
multiples(3, numbers)


func sortedNamesByLastName(in names: [(String, String)]) -> [(String, String)] {
    return names.sorted { $0.1 < $1.1 } // ascending
}

let firstAndLastTuples = [
    ("Johann S.", "Bach"),
    ("Claudio", "Monteverdi"),
    ("Duke", "Ellington"),
    ("W. A.", "Mozart"),
    ("Nicolai","Rimsky-Korsakov"),
    ("Scott","Joplin"),
    ("Josquin","Des Prez")
]

sortedNamesByLastName(in: firstAndLastTuples)


func sumOfSquaresOfOddNumbers(in numbers: [Int]) -> Int {
    return numbers.filter { $0 % 2 != 0 }.map { $0 * $0}.reduce (0,+)
}

let evenMoreNumbers = [1, 2, 3, 4, 5, 6]
sumOfSquaresOfOddNumbers(in: evenMoreNumbers)

func mapFunction<T>(_ numbers: [T], closure: (T) -> (T)) -> [T] {
    var array = [T]()
    
    for num in numbers {
        array.append(closure(num))
    }
    
    return array
}

mapFunction([1,2,3,4]) { (num) -> (Int) in
    return num * num
}

print(mapFunction([1,2,3,4]) { $0 * $0})
