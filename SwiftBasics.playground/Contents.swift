//: Playground - noun: a place where people can play

import UIKit

var lineNumber: Int


/*:
# I. DATA TYPES

## 1. Numerals
*/
let lnI1 = #line
let uInt8MaxValue = UInt8.max
let uInt16MaxValue = UInt16.max
let uInt32MaxValue = UInt32.max
let int64MaxValue = Int64.max
let int64MinValue = Int64.min
let intMaxValue = Int.max

let meaningOfLife = 42
let pi = 3.14159 // Type inference

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)


let three = 3
let pointoneFourOneFiveNine = 0.14159
let anotherPi = Double(three) + pointoneFourOneFiveNine
let integerPi = Int(anotherPi)

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
/*:
## 2. Booleans
*/
let lnI2 = #line
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious{
    print("Mmmmmm tasty turnips")
}else{
    
    print("Eww, turnips are horrible")
}

let i = 1
if i==1 {
    
    print("i is equal to one")
}

/*:
## 3. Strings
*/
let lnI3 = #line
let someString = "Some string litteral value"

var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty{
    print("Nothing to see here")
}

var variableString = "Horse"
variableString += " and carriage"


for character in "Dog! 🐶".characters{
    
    print(character)
}


let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "🐱"]
let catString = String(catCharacters)
print(catString)

let string1 = "hello"
let string2 = "there"

var welcome = string1 + string2

var instructions = "look over "
instructions += string2

welcome.append(exclamationMark)
/*:
### a. String interpolation
*/
let lnI3a = #line
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
/*:
### b. Special characters
*/
let lnI3b = #line
let specialcharacters = "null character: \0, backslash:\\, horizontal tab: \t, line feed: \n, carriage return: \r, double quote: \", single quote: \'"
/*:
### c. unicode characters
*/
let lnI3c = #line
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"
/*:
### d. extended grapheme clusters
*/
let lnI3d = #line
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
/*:
### e. Counting characters
*/
let lnI3e = #line
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusual menagerie has \(unusualMenagerie.characters.count) characters")

/*:
### f. string indices
*/
let lnI3f = #line
let greeting = "Guten Tag!"

greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

for index in greeting.characters.indices{
    print("\(greeting[index])", terminator:"")
}

var welcome1 = "hello"
welcome1.insert("!", at: welcome1.endIndex)

welcome1.insert(contentsOf:" there".characters, at: welcome1.index(before: welcome1.endIndex))
welcome1.remove(at:welcome1.index(before: welcome1.endIndex))

let range = welcome1.index(welcome1.endIndex, offsetBy: -6)..<welcome.endIndex
welcome1.removeSubrange(range)
/*:
### g. Comparing strings
*/
let lnI3g = #line
let quotation = "Hello"
let sameQuotation = "Hello"

if quotation == sameQuotation{
    print("These two strings considered equal")
}
/*:
### h. prefix and suffix equality
*/
let lnI3h = #line
let romeoAndjuliette = [
    "Act 1 Scene 1, Verona, a public place",
    "Act 1 Scene 2, Capulet's mansion",
    "Act 1 Scene 3, A room in Capulet's mansion",
    "Act 1 Scene 4, A street outside Capulet's mansion",
    "Act 1 Scene 5, The great hall in Capulet's mansion",
    "Act 2 Scene 1, Outside Capulet's mansion",
    "Act 2 Scene 2, Capulet's orchard",
    "Act 2 Scene 3, Outside Friar Lawrence's orchard",
    "Act 2 Scene 4, A street in Verona",
    "Act 2 Scene 5, Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var actOneSceneCount = 0
var mansionScenes = 0

for scene in romeoAndjuliette{
    if scene.hasPrefix("Act 1"){
        actOneSceneCount += 1
    }
    
    if scene.hasSuffix("Capulet's mansion"){
        mansionScenes += 1
    }
}

print("There are \(actOneSceneCount) scenes in act 1 and \(mansionScenes) mansion scenes")


let dogString = "Dog‼🐶"

for codeUnit in dogString.utf8{
    print("\(codeUnit)", terminator:"")
}

for codeUnit in dogString.utf16{
    print("\(codeUnit)", terminator:"")
}

for codeUnit in dogString.unicodeScalars{
    print("\(codeUnit)", terminator:"")
}
/*:
## 4. Tupples
*/
let lnI4 = #line
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error

print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

print("The status code is \(http404Error.0), the status message is \(http404Error.1)")


let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")
/*:
## 5. Arrays

Arrays are ordered collections of values

### a. Initialization
*/
let lnI5a = #line
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
var emptyArray = [String]()
var someInts = [Int]()
someInts = []
emptyArray = []
var threeDoubles = [Double](repeating: 0.0, count:3)
/*:
### b. Adding arrays
*/
let lnI5b = #line
var anotherThreeDoubles = [Double] (repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
/*:
### c. Accessing and modifying an array
*/
let lnI5c = #line
print("The shopping list contains\(shoppingList.count) items")

if shoppingList.isEmpty{
    print("shopping list is empty")
}else{
    print("shopping list is not empty")
}

shoppingList [1] = "bottle of water"  // subscript syntax
shoppingList[1...3] = ["bananas", "apples"]

someInts.append(3)
shoppingList.append("a fish")
shoppingList += ["Baking Powder"]
shoppingList.insert("mapple syrup", at: 0)
let mappleSyrup = shoppingList.remove(at: 0)
shoppingList.removeLast()
/*:
### d. iterating
*/
let lnI5d = #line
for item in shoppingList{
    print(item)
}

for (index, value) in shoppingList.enumerated(){
    print("Item: \(index + 1): \(value)")
}
/*:
## 6. Sets

Sets are unordered collections of unique values

### a. Initialization
*/
let lnI6a = #line
var letters = Set<Character>()
print("letters is a type of Set<Character> with \(letters.count) items")

letters = []

var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
print("I have \(favoriteGenres.count) favorite music genres")

if favoriteGenres.isEmpty{
    print("favoriteGenres is empty")
}else{
    print("favoriteGenres is not empty")
}

/*:
### b. Modifying a set
*/
let lnI6b = #line
letters.insert("a")
favoriteGenres.insert("Funk")

if let removedGenre = favoriteGenres.remove("Rock"){
    print("I hate \(removedGenre)")
} else {
    print("Failed to remove rock")
}

if favoriteGenres.contains("Funk"){
    print("set contains funk")
} else {
    print("set does not contain funk")
}
/*:
### c. Iterating over elements of a set
*/
let lnI6c = #line
for genre in favoriteGenres{
    print("\(genre)")
}

for genre in favoriteGenres.sorted(){
    print("\(genre)")
}

var oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

let set1 = oddDigits.union(evenDigits).sorted()
let set2 = oddDigits.intersection(evenDigits).sorted()
let set3 = oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
let set4 = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)
/*:
## 7. Dictionaries

Dictionaries are unordered collections of key-value associations

### a. Initialization
*/
let lnI7a = #line
var emptyDict = [String: Float]()
emptyDict = [:]
var namesOfIntegers = [Int : String]()

var occupations = [
    "Malcom" : "Captain",
    "Kaylee" : "Mechanic"]


namesOfIntegers = [:]

var airports = ["YYZ" : "Toronto Pearson", "DUB" : "Dublin"]
/*:
### b. Accessing and modifying a Dictionary
*/
let lnI7b = #line
print ("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty{
    print("The airport dictionary is empty")
} else {
    print("The airport dictionary is not empty")
}

occupations ["Jayne"] = "Public Relations"
namesOfIntegers [16] = "sixteen"
airports ["LHR"] = "London"
airports ["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB"){
    print("The old value for DUB was \(oldValue)")
}

if let airportname = airports["DUB"]{
    print("The name of the airport is \(airportname)")
} else {
    print("The airport name is not in the dictionary")
}

airports["LHR"] = nil;

if let removedValue = airports.removeValue(forKey: "DUB"){
    print("The removed airport name is \(removedValue)")
}
/*:
### c. Iterating
*/
let lnI7c = #line
for (airportCode, airportName) in airports{
    print("\(airportCode): \(airportName)")
    
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values{
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportnames = [String](airports.values)
/*:
## 8. Optionals
*/
let lnI8 = #line
let nickName: String? = nil
let fullName:String = "John Appleseed"

let informalGreeting = "Hi \(nickName ?? fullName)"


let numberString = "123"
let possibleNumber = "1a12"
let convertedNumber = Int(numberString)
let convertedNumber2 = Int(possibleNumber)


var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String?

if convertedNumber != nil{
    print("convertedNumber contains the following value:")
    print(convertedNumber!)// forced unwrapping
}
/*:
### a. Optional binding
*/
let lnI8a = #line
if let actualNumber = Int(numberString){
    
    print("\"\(numberString)\" has an integer value of \(actualNumber)")
}


if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber{
    
    print("\(firstNumber) < \(secondNumber)")
}
/*:
### b. Implicitely unwrapped optional
*/
let lnI8b = #line
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "An implicitely unwrapped optional string"
let implicitString: String = assumedString
/*:
you can still check an implicitely unwrapped optional for nil (why!!!!!! Isn't it garanteed to not be nil?)
*/
if assumedString != nil {
    print(assumedString)
}

if let definiteString = assumedString{
    print(definiteString)
}
/*:
# II. Basic operators
## 1. Assignment Operator
*/
let lnII1 = #line
let b = 10
var a = 5
a = b
let (x, y) = (1, 2)
/*:
## 2. Arithmetic operators
*/
let lnII2 = #line
var m = 1 + 2       // equals 3
m = 5 - 3       // equals 2
m = 2 * 3       // equals 6
var n = 10.0 / 2.5  // equals 4.0


let helloWorld = "hello, " + "world"
/*:
## 3. Remainder operator
*/
let lnII3 = #line
m = 9 % 4    // equals 1
m = -9 % 4   // equals -1
/*:
## 4. Unary minus operator
*/
let lnII4 = #line
let three2 = 3
let minusThree = -three2
let plusThree = -minusThree
/*:
## 5. Unary plus operator
*/
let lnII5 = #line
let minusSix = -6
let alsoMinusSix = +minusSix
/*:
## 6. Compound assignment operators
*/
let lnII6 = #line
var aa = 1
aa += 2
/*:
## 7. Comparison operators
*/
let lnII7 = #line
1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

let name = "world"
if name == "world"{
    print("hello world")
}else{
    print("sorry")
}
/*:
### works with tupples
*/
(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")
/*:
## 8. Ternary conditional operators
*/
let lnII8 = #line
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
/*:
## 9. Nil Coalescing Operator
*/
let lnII9 = #line
let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName
/*:
## 10. Range operators
*/
let lnII10 = #line
for index in 1...5 { // closed range
    print("\(index) times 5 is \(index * 5)")
}

let names = ["Anna", "Alex", "Brian", "Jack"]
for i in 0..<names.count{
    print("Person \(i + 1) is called \(names[i])")
}
/*:
## 11. Logical operators
*/
let lnII11 = #line
let allowedEntry = false

if !allowedEntry{  // logical not operator
    print("Access Denied")
}

let enteredDoorCode = true
let passedRetinaScan = false

if enteredDoorCode && passedRetinaScan{  // logical AND operator
    print("Welcome")
} else{
    print("Access Denied")
}


let hasDoorKey = false
let knowOverridePassword = true

if hasDoorKey || knowOverridePassword{  // logical OR operator
    print("Welcome")
}else{
    print("Access denied")
}
/*:
# III. Control Flows

## 1. For loops
*/
let lnIII1 = #line
var total = 0


for i in 0..<4 // for a range which ommits the upper value
{
    total += i
}

for i in 0...4 // for a range which includes the upper value
{
    total += i
}

let base = 3
let power = 10
var answer = 1

for _ in 1...power{
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")


let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

for score in individualScores
{
    
    if score > 50
    {
        teamScore += 3
    }
    else
    {
        teamScore += 1
    }
    
}

print(teamScore)


let interestingNumbers = [
    "Prime" : [2, 3, 5, 7, 11, 13],
    "Fibonacci" : [1, 1, 2, 3, 5, 8],
    "Square" : [1, 4, 9, 16, 25]
]

var largest = 0

for (kind, numbers) in interestingNumbers
{
    for number in numbers
    {
        if number > largest
        {
            largest = number
            
        }
        
    }
}

print(largest)
/*:
## 2. While loops
*/
let lnIII2 = #line
var na = 2
while na < 100
{
    na = na * 2
    
}

print(na)

var ma = 2

repeat
{
    ma = ma * 2
    
}
    while ma < 100

print(ma)


let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)

board[03] = +08
board[06] = +11
board[09] = +09
board[10] = +02
board[14] = -10
board[19] = -11
board[22] = -02
board[24] = -08

var square = 0
var diceRoll = 0

while square < finalSquare{
    
    // roll the dice
    
    diceRoll += 1
    if diceRoll == 7 {diceRoll = 1}
    
    // move by the rolled amount
    square += diceRoll
    
    
    if square < board.count{
        // we are still on the board, move up or down for a snake or a ladder
        
        square += board[square]
    }
}

print("Game over")
/*:
## 3. If Statements
*/
let lnIII3 = #line
let temperatureInFahrenheit = 72

if temperatureInFahrenheit <= 32 {
    print("It's very cold")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm")
}
/*:
## 4. Switch Statements
Considerably more powerful than its counterparts in many C-like languages.

- Can match different patterns like interval matches, tuples, and casts to a specific type
- Values can be bound to a temporary constant/variable for use within the case's body
- complex matching conditions can be expressed using the where clause
*/
let lnIII4 = #line
let vegetable = "red pepper"

switch vegetable
{
case "celery":
    print("Add some raisins and make ants on a log.")
    
case "cucumber", "watercress":
    print("That would be a good sandwich")
    
case let x where x.hasSuffix("pepper"):
    
    print("It is a spicy: \(x)")
    
default:
    
    print("Everything tastes good")
    
}



let someCharacter: Character = "e"

switch someCharacter{
    
case "a", "e", "i", "o", "u":
    
    print("\(someCharacter) is a vowel")
    
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    
    print("\(someCharacter) is a consonant")
    
default:
    print("\(someCharacter) is not a vowel or a consonant")
}
/*:
### a. Interval matching
*/
let lnIII4a = #line
let approximateCount = 62
let countedThings = "moons orbiting Saturn"

var naturalCount: String

switch approximateCount{
    
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
    
}

print("There are \(naturalCount) \(countedThings).")
/*:
### b. Tuples
*/
let lnIII4b = #line
let somePoint = (1, 1)

switch somePoint{
    
case (0, 0):
    
    print("(0, 0) is at the origin")
    
case (_, 0):
    
    print("(\(somePoint.0), 0) is on the x-axis")
    
case (0, _):
    
    print("(0, \(somePoint.1)) is on the y-axis")
    
case (-2...2, -2...2):
    
    print("(\(somePoint.0), \(somePoint.1) is inside the box")
    
default:
    
    print("(\(somePoint.0), \(somePoint.1)) is outside the box")
    
}
/*:
### c. value bindings
*/
let lnIII4c = #line
let anotherPoint = (2, 0)

switch anotherPoint {
    
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case(0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y)")
    
    
}
/*:
### d. where clause
*/
let lnIII4d = #line
let yetAnotherPoint = (1, -1)

switch yetAnotherPoint{
    
case let (x, y) where x == y:
    print("(\(x), \(y) is on the line x == y)")
case let (x, y) where x == -y:
    print("(\(x), \(y) is on the line x == -y)")
case let (x, y):
    print("(\(x), \(y) is just some arbitrary point)")
    
}
/*:
## 5. Control Transfer Statements
### a. Continue
*/
let lnIII5a = #line
let puzzleInput = "great minds think alike"

var puzzleOutput = ""

for character in puzzleInput.characters{
    
    switch character{
        
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
        
    }
    
    
}

print(puzzleOutput)
/*:
### b. Break
*/
let lnIII5b = #line
let numberSymbol: Character = "三"

var possibleintegervalue: Int?



switch numberSymbol{
    
case "1", "١", "一", "๑":
    possibleintegervalue = 1
    
case "2", "٢", "二", "๒":
    possibleintegervalue = 2
    
case "3", "٣", "三", "๓":
    possibleintegervalue = 3
    
case "4", "٤", "四", "๔":
    possibleintegervalue = 4
    
default:
    break
    
    
}

if let integerValue = possibleintegervalue{
    
    print("The integer value of \(numberSymbol) is \(integerValue)")
} else {
    
    print("An integer value could not be found")
}
/*:
### c. Fallthrough
*/
let lnIII5c = #line
let integerToDescribe = 5

var description = "The number \(integerToDescribe) is)"

switch integerToDescribe{
    
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    
    fallthrough
    
default:
    description += " an integer."
    
}

print(description)
/*:
### d. Statement label
*/
let lnIII5d = #line
let finalSquare2 = 25
var board2 = [Int](repeating: 0, count: finalSquare2 + 1)

board2[03] = +08
board2[06] = +11
board2[09] = +09
board2[10] = +02
board2[14] = -10
board2[19] = -11
board2[22] = -02
board2[24] = -08

var square2 = 0
var diceRoll2 = 0


gameLoop: while square2 != finalSquare2{
    
    diceRoll2 += 1
    
    if diceRoll2 == 7 {diceRoll2 = 1}
    
    switch square2 + diceRoll2{
        
    case finalSquare:
        
        break gameLoop
        
    case let newSquare where newSquare > finalSquare2:
        
        continue gameLoop
        
    default:
        
        square2 += diceRoll2
        square2 += board[square2]
        
        
    }
    
}

print("Game over")
/*:
### e. Early exit
*/
let lnIII5e = #line
func greet(person: [String : String]){
    
    guard let name = person ["name"] else {
        return
    }
    
    print("Hello \(name)")
    
    guard let location = person ["location"] else {
        
        print("I hope the weather is nice near you")
        
        return
        
    }
    
    print("I hope the weather is nice in \(location)")
    
}

greet(person: ["name" : "John"])
/*:
### f. Checking API availaility
*/
let lnIII5f = #line
if #available(iOS 9, OSX 10.10, *){
    
    
} else {
    
    
}

enum TopLevel {
	case data_Types (DataTypeSection)
	case basic_Operators (BasicOperatorsSection)
	case control_Flows (ControlFlowsSection)
}

enum DataTypeSection {
	case numerals
	case booleans
	case strings (StringsSection)
	case tupples
	case arrays (ArraysSection)
	case sets (SetsSection)
	case dictionaries (DictionariesSection)
	case optionals (OptionalsSection)
}

enum StringsSection {
	case interpolation
	case special_Characters
	case unicode_Characters
	case extended_Grapheme_Clusters
	case counting_Characters
	case string_Indices
	case comparing_Strings
	case prefix_And_Suffix
}

enum ArraysSection {
	case initialization
	case adding_Arrays
	case modifying_Arrays
	case iterating
}

enum SetsSection {
	case initialization
	case modifying_A_Set
	case iterating_Over_Elements_Of_A_Set
}

enum DictionariesSection {
	case initialization
	case accessing_And_Modifying_A_Dictionary
	case iterating
}

enum OptionalsSection {
	case optional_Binding
	case implicitly_Unwrapped_Optionals
}

enum BasicOperatorsSection {
	case assignment_Operator
	case arithmentic_Operator
	case remainder_Operator
	case unary_Minus_Operator
	case compound_Assignment_Operators
	case comparison_Operators
	case ternary_Conditional_Operator
	case nil_Coalescing_Operator
	case range_Operators
	case logical_Operators
}

enum ControlFlowsSection {
	case for_Loops
	case while_Loops
	case if_Statements
	case switch_Statements (SwitchStatementsSection)
	case control_Transfer_Statements (ControlTransferSection)
}

enum SwitchStatementsSection {
	case intervalMatching
	case tuples
	case value_Binding
	case where_Clause
}

enum ControlTransferSection {
	case continue_Statement
	case break_Statement
	case fallthrough_Statement
	case statement_Label
	case early_Exit
	case API_Availability
	
}

func tableOfContent(with input: TopLevel) -> Int {
	switch input {
	case .data_Types(let dataTypes):
		switch dataTypes {
		case .numerals:
			return lnI1
		case .booleans:
			return lnI2
		case .strings (let strings):
			switch strings {
			case .interpolation:
				return lnI3a
			case .special_Characters:
				return lnI3b
			case .unicode_Characters:
				return lnI3c
			case .extended_Grapheme_Clusters:
				return lnI3d
			case .counting_Characters:
				return lnI3e
			case .string_Indices:
				return lnI3f
			case .comparing_Strings:
				return lnI3g
			case .prefix_And_Suffix:
				return lnI3h
			}
		case .tupples:
			return lnI4
		case .arrays(let arrays):
			switch arrays {
			case .initialization:
				return lnI5a
			case .adding_Arrays:
				return lnI5b
			case .modifying_Arrays:
				return lnI5c
			case .iterating:
				return lnI5d
			}
		case .sets (let sets):
			switch sets{
			case .initialization:
				return lnI6a
			case .modifying_A_Set:
				return lnI6b
			case .iterating_Over_Elements_Of_A_Set:
				return lnI6c
			}
		case .dictionaries(let dictionaries) :
			switch dictionaries {
			case .initialization:
				return lnI7a
			case .accessing_And_Modifying_A_Dictionary:
				return lnI7b
			case .iterating:
				return lnI7c
			}
		case .optionals(let optionals):
			switch optionals {
			case .optional_Binding:
				return lnI8a
			case .implicitly_Unwrapped_Optionals:
				return lnI8b
			}
		}
	case .basic_Operators(let basicOperators):
		switch basicOperators {
		case .assignment_Operator:
			return lnII1
		case .arithmentic_Operator:
			return lnII2
		case .remainder_Operator:
			return lnII3
		case .unary_Minus_Operator:
			return lnII4
		case .compound_Assignment_Operators:
			return lnII5
		case .comparison_Operators:
			return lnII6
		case .ternary_Conditional_Operator:
			return lnII7
		case .nil_Coalescing_Operator:
			return lnII8
		case .range_Operators:
			return lnII9
		case .logical_Operators:
			return lnII10
		}
	case .control_Flows(let controlFlows):
		switch controlFlows {
		case .for_Loops:
			return lnIII1
		case .while_Loops:
			return lnIII2
		case .if_Statements:
			return lnIII3
		case .switch_Statements (let switchStatements):
			switch switchStatements {
			case .intervalMatching:
				return lnIII4a
			case .tuples:
				return lnIII4b
			case .value_Binding:
				return lnIII4c
			case .where_Clause:
				return lnIII4d
			}
		case .control_Transfer_Statements (let controlTransfer):
			switch controlTransfer{
			case .break_Statement:
				return lnIII5a
			case .continue_Statement:
				return lnIII5b
			case .fallthrough_Statement:
				return lnIII5c
			case .statement_Label:
				return lnIII5d
			case .early_Exit:
				return lnIII5e
			case .API_Availability:
				return lnIII5f
			}
		}
	}
}

//TABLE OF CONTENT

//I. DATA TYPES
//	1. Numerals
	tableOfContent(with: .data_Types(.numerals))
//	2. Booleans
	tableOfContent(with: .data_Types(.booleans))
//	3. Strings
//		a. String interpolation
		tableOfContent(with: .data_Types(.strings(.interpolation)))
//		b. Special characters
		tableOfContent(with: .data_Types(.strings(.special_Characters)))
//		c. Unicode characters
		tableOfContent(with: .data_Types(.strings(.unicode_Characters)))
//		d. Extended grapheme clusters
		tableOfContent(with: .data_Types(.strings(.extended_Grapheme_Clusters)))
//		e. Counting characters
		tableOfContent(with: .data_Types(.strings(.counting_Characters)))
//		f. String indices
		tableOfContent(with: .data_Types(.strings(.string_Indices)))
//		g. Comparing strings
		tableOfContent(with: .data_Types(.strings(.comparing_Strings)))
//		h. Prefix and suffix equality
		tableOfContent(with: .data_Types(.strings(.prefix_And_Suffix)))
//	4. Tupples
	tableOfContent(with: .data_Types(.tupples))
//	5. Arrays
//		a. Initialization
		tableOfContent(with: .data_Types(.arrays(.initialization)))
//		b. Adding arrays
		tableOfContent(with: .data_Types(.arrays(.adding_Arrays)))
//		c. Accessing and modifying an array
		tableOfContent(with: .data_Types(.arrays(.modifying_Arrays)))
//		d. Iterating
		tableOfContent(with: .data_Types(.arrays(.iterating)))
//	6. Sets
//		a. Initialization
		tableOfContent(with: .data_Types(.sets(.initialization)))
//		b. Modifying a set
		tableOfContent(with: .data_Types(.sets(.modifying_A_Set)))
//		c. Iterating over elements of a set
		tableOfContent(with: .data_Types(.sets(.iterating_Over_Elements_Of_A_Set)))
//	7. Dictionaries
//		a. Initialization
		tableOfContent(with: .data_Types(.dictionaries(.initialization)))
//		b. Accessing and modifying a dictionary
		tableOfContent(with: .data_Types(.dictionaries(.accessing_And_Modifying_A_Dictionary)))
//		c. Iterating
		tableOfContent(with: .data_Types(.dictionaries(.iterating)))
//	8. Optionals
//		a. Optional binding
		tableOfContent(with: .data_Types(.optionals(.optional_Binding)))
//		b. Implicitely unwrapped optional
		tableOfContent(with: .data_Types(.optionals(.implicitly_Unwrapped_Optionals)))
//II.BASIC OPERATORS
//	1. Assignment operator
	tableOfContent(with: .basic_Operators(.assignment_Operator))
//	2. Arithmetic operators
	tableOfContent(with: .basic_Operators(.arithmentic_Operator))
//	3. Remainder operator
	tableOfContent(with: .basic_Operators(.remainder_Operator))
//	4. Unary minus operator
	tableOfContent(with: .basic_Operators(.unary_Minus_Operator))
//	5. Compound assignment operators
	tableOfContent(with: .basic_Operators(.compound_Assignment_Operators))
//	6. Comparison operators
	tableOfContent(with: .basic_Operators(.comparison_Operators))
//	7. Ternary conditional operators
	tableOfContent(with: .basic_Operators(.ternary_Conditional_Operator))
//	8. Nil Coalescing Operator
	tableOfContent(with: .basic_Operators(.nil_Coalescing_Operator))
//	9. Range operators
	tableOfContent(with: .basic_Operators(.range_Operators))
//	10. Logical operators
	tableOfContent(with: .basic_Operators(.logical_Operators))
//III. CONTROL FLOWS
//	1. For loops
	tableOfContent(with: .control_Flows(.for_Loops))
//	2. While loops
	tableOfContent(with: .control_Flows(.while_Loops))
//	3. If statements
	tableOfContent(with: .control_Flows(.if_Statements))
//	4. Switch statements
//		a. Interval matching
		tableOfContent(with: .control_Flows(.switch_Statements(.intervalMatching)))
//		b. Tuples
		tableOfContent(with: .control_Flows(.switch_Statements(.tuples)))
//		c. Value binding
		tableOfContent(with: .control_Flows(.switch_Statements(.value_Binding)))
//		d. Where clause
		tableOfContent(with: .control_Flows(.switch_Statements(.where_Clause)))
//	5. Control Transfer Statements
//		1. Continue
		tableOfContent(with: .control_Flows(.control_Transfer_Statements(.continue_Statement)))
//		2. Break
		tableOfContent(with: .control_Flows(.control_Transfer_Statements(.break_Statement)))
//		3. Fallthrough
		tableOfContent(with: .control_Flows(.control_Transfer_Statements(.fallthrough_Statement)))
//		4. Statement label
		tableOfContent(with: .control_Flows(.control_Transfer_Statements(.statement_Label)))
//		5. Early exit
		tableOfContent(with: .control_Flows(.control_Transfer_Statements(.early_Exit)))
//		6. Checking API availability
		tableOfContent(with: .control_Flows(.control_Transfer_Statements(.API_Availability)))
