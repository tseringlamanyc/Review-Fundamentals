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
let specialString = "Swift is cool.\nSwift was introduced in 2014"
print(specialString)

var anotherStringLiteral = "" // using string literal
print(anotherStringLiteral.isEmpty)

var emptyStrInitializationSyntax = String()

//MARK:- STRING ARE VALUE TYPES
var original = "original"
var copy = original  // passing copies aroudn

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
//let endChar = statement[statement.endIndex]
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
