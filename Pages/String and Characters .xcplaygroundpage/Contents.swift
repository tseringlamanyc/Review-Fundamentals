import Foundation

//MARK:- STRINGS AND CHARACTERS
// string is a collection of characters

//MARK:- STRING LITERAL
var str = "welcome to swift fundamentals"
print(str)

let multiline = """
This is a multiline. First line
Second line
Third line
"""

print(multiline)

//MARK:- SPECIAL CHARACTERS
// \n \t \"\'
let specialString = "Swift is cool.\nSwift was \"introduced\" in 2014"
print(specialString)

var anotherStringLiteral = "" // using string literal
print(anotherStringLiteral.isEmpty)

var emptyStrInitializationSyntax = String()

//MARK:- STRING ARE VALUE TYPES
var original = "original"
var copy = original  // passing copies around

print(original, copy)

copy = "made a copy"

print(original, copy)

//MARK:- ACCESSING INDVIDUAL ELEMENTS
// for loops

let iterateStr = "Anderson the spider silva"
for char in iterateStr {
    print(char)
}

//MARK:- USING TYPE ANNOTATION WHEN DEFINING A CHARACTER
let emoji: Character = "😜"

//MARK:- CONCATENATION (add together) STRING USING append() AND +=
var str1 = "hello"
var str2 = "world"

str1.append(str2)
print(str1)

str1 += str2
print(str1)

//MARK:- STRING INTERPOLATION - constants, variables, expressions
print("Adding values together \(4 + 10)")

//MARK:- UNICODE - standard for representing various char in languages around the world ( \u{1F425} )
print("unicode char is \u{1F425}")

//MARK:- COUNTING CHARACTERS
let strCount = "This is sparta"
print(strCount.count)

//MARK:- ACCESSING AND MODIFYING STRINGS
var statement = "Javscript is the language of the web"

// startIndex
let firstChar = statement[statement.startIndex]
//let endChar = statement[statement.endIndex] // endindex is position after the last character in the string
let lastIndex = statement.index(before: statement.endIndex)
let endChar = statement[lastIndex]
print(firstChar)
print(endChar)

// offset
let offsetIndex = statement.index(statement.endIndex, offsetBy: -3)
let substring = statement[offsetIndex...lastIndex]
print(substring)

// inserting and removing
statement.insert("*", at: lastIndex)
print(statement)

statement.remove(at: lastIndex)
print(statement)

//MARK:- COMPARING STRINGS
var name1 = "Tsering"
var name2 = "tsering"

if name1 == name2 {
    print("same name")
} else {
    print("different name")
}

//MARK:- PREFIX AND SUFFIX
let prefixStr = "Tsering"
let suffixStr = "Running"

if prefixStr.hasPrefix("Tl") {
    print("it does")
} else {
    print("it doesnt")
}

if suffixStr.hasSuffix("ing") {
    print("word ends in \"ing\"")
}

// MARK: - EXERCISES
var stringInt = ""

for num in 1...10 {
    stringInt += num.description
}

print(stringInt)

for num in 5...51 {
    if num % 2 == 0 {
        print(num, terminator: ",")
    }
}

var endingIn4 = ""

for num in 1...60 {
    if num % 10 == 4 {
        endingIn4 += num.description
    }
}

print()

print(endingIn4)

let myStringSeven = "Hello world!"

let lastIndex1 = myStringSeven.index(before: myStringSeven.endIndex)
print(myStringSeven[lastIndex1])

var aString = "Replace the letter e with *"
var noE = ""

for char in aString {
    if char == "e" {
        noE += "*"
        continue
    }
    noE.append(char)
}

print(noE)

//aString.replacingOccurrences(of: "e", with: "*")

var reverseStr = ""

for char in aString {
    reverseStr = String(char) + reverseStr
}

print(reverseStr)

let problem = "split this string into words and print them on separate lines"

let words = problem.split(separator: " ")

for word in words {
    print(word)
}

let problem1 = "find the longest word in the problem description"
let problemArr = problem1.split(separator: " ")

for word in problemArr {
    
    var largestWord = ""
    
    if word.count > largestWord.count {
        largestWord += String(word)
    }
    
    print(largestWord)
}

let vowels = ("aeiou")
let consonants = ("bcdfghjklmnpqrstvwxyz")
let input = "Count how many vowels I have!"

var vowelsConsonantsCount: (vowels: Int, consonants: Int) = (0, 0)

for char in input.lowercased() {
  if vowels.contains(char) {
    vowelsConsonantsCount.vowels += 1
    continue
  }
  if consonants.contains(char) {
    vowelsConsonantsCount.consonants += 1
  }
}

print(vowelsConsonantsCount)


let ques12 = "How are you doing this Monday?"
let offsetIndex12 = ques12.index(ques12.endIndex, offsetBy: -7)
let lastWord12 = ques12[offsetIndex12...ques12.index(before: ques12.endIndex)]
print(lastWord12.count)

let testString = "  How   about      thesespaces  ?  "

var condensedString = ""
var previousChar: Character = "*"

for char in testString {
  if previousChar == " " && char == " " {
    continue
  }
  condensedString.append(char)
  previousChar = char
}

print(condensedString)

let ques14 = "Swift is the best language"
var ques14Arr = ques14.split(separator: " ")

var left = 0
var right = ques14Arr.count - 1

for _ in ques14Arr {
    while left < right {
        let temp = ques14Arr[left]  // swift
        
        ques14Arr[left] = ques14Arr[right]
        ques14Arr[right] = temp
        
        left += 1
        right -= 1
    }
}

print(ques14Arr.joined(separator: " "))

let ques15 = "danaerys dad cat civic bottle"

func palCount(string: String) -> Int {
    
    var count = 0
    
    let strArr = string.split(separator: " ")
    
    for word in strArr {
        if word == String(word.reversed()) {
            count += 1
        }
    }
    
    return count
}

palCount(string: ques15)


let ques16 = "LLL"

func rewardStudent(string: String) -> Bool {
    
    // more than one A
    // 2 continous L
    
    var aCount = 0
    var lCount = 0
    var previousChar: Character = "x"
    
    for str in string.lowercased() {
        if str == "a" {
            aCount += 1
        }
        
        if str == "l" {
            lCount += 1
            if previousChar == "l" {
                if lCount > 2 {
                    return false
                }
            }
        }
        previousChar = str
    }
    
    if aCount > 1 {
        return false
    }
    
    return true
}

rewardStudent(string: ques16)

func ransomNote(note: String, magazine: String) -> Bool {
    
    var noteDict = [Character: Int]()
    
    for char in note {
        noteDict[char] = (noteDict[char] ?? 0) + 1
    }
    
    for char in magazine {
        if let noteCount = noteDict[char] {
            if noteCount > 1 {
                noteDict[char] = noteCount - 1
            } else {
                noteDict[char] = nil
            }
        }
    }
    
    return noteDict.count == 0
}

ransomNote(note: "a", magazine: "b")
ransomNote(note: "aa", magazine: "aab")
