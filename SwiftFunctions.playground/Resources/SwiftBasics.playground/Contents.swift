//: Playground - noun: a place where people can play

import UIKit


/* ********************************************************************************** */
/* ********************************************************************************** */
/*                                     DATA TYPES                                     */
/* ********************************************************************************** */
/* ********************************************************************************** */


/* ********************************************************************* */
/*                                NUMERALS                               */
/* ********************************************************************* */

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

/* ********************************************************************* */
/*                                BOLEANS                                */
/* ********************************************************************* */


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


/* ********************************************************************* */
/*                                STRINGS                                */
/* ********************************************************************* */

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

// String interpolation

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"


// Special characters

let specialcharacters = "null character: \0, backslash:\\, horizontal tab: \t, line feed: \n, carriage return: \r, double quote: \", single quote: \'"

// unicode characters

let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

// extended grapheme clusters

let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

// Counting characters

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusual menagerie has \(unusualMenagerie.characters.count) characters")

// string indices

let greeting = "Guten Tag!"

greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]
let index = greeting.startIndex.advancedBy(7)
greeting[index]

for index in greeting.characters.indices{
    print("\(greeting[index])", terminator:"")
}

var welcome1 = "hello"
welcome1.insert("!", atIndex: welcome1.endIndex)
welcome1.insertContentsOf(" there".characters, at: welcome1.endIndex.predecessor())
welcome1.removeAtIndex(welcome1.endIndex.predecessor())

let range = welcome1.endIndex.advancedBy(-6)..<welcome.endIndex
welcome1.removeRange(range)

// Comparing strings

let quotation = "Hello"
let sameQuotation = "Hello"

if quotation == sameQuotation{
    print("These two strings considered equal")
}

// prefix and suffix equality


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


/* ********************************************************************* */
/*                                TUPPLES                                */
/* ********************************************************************* */


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



/* ********************************************************************* */
/*                                  ARRAYS                               */
/* ********************************************************************* */


// Arrays are ordered collections of values


// Initialization

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
var emptyArray = [String]()
var someInts = [Int]()
someInts = []
emptyArray = []
var threeDoubles = [Double](count:3, repeatedValue: 0.0)

// Adding arrays

var anotherThreeDoubles = [Double] (count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles

// Accessing and modifying an array


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
shoppingList.insert("mapple syrup", atIndex: 0)
let mappleSyrup = shoppingList.removeAtIndex(0)
shoppingList.removeLast()


// iterating

for item in shoppingList{
    print(item)
}

for (index, value) in shoppingList.enumerate(){
    print("Item: \(index + 1): \(value)")
}


/* ********************************************************************* */
/*                                  SETS                                 */
/* ********************************************************************* */

// Sets are unordered collections of unique values


// initialization

var letters = Set<Character>()
print("letters is a type of Set<Character> with \(letters.count) items")

letters = []

var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]


// accessing and modifying a set

print("I have \(favoriteGenres.count) favorite music genres")

if favoriteGenres.isEmpty{
    print("favoriteGenres is empty")
}else{
    print("favoriteGenres is not empty")
}

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

// Iterating over elements of a set


for genre in favoriteGenres{
    print("\(genre)")
}

for genre in favoriteGenres.sort(){
    print("\(genre)")
}

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

let set1 = oddDigits.union(evenDigits).sort()
let set2 = oddDigits.intersect(evenDigits).sort()
let set3 = oddDigits.subtract(singleDigitPrimeNumbers).sort()
let set4 = oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isSupersetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals)

/* ********************************************************************* */
/*                             DICTIONARIES                              */
/* ********************************************************************* */

// Dictionaries are unordered collections of key-value associations

var emptyDict = [String: Float]()
emptyDict = [:]
var namesOfIntegers = [Int : String]()

var occupations = [
    "Malcom" : "Captain",
    "Kaylee" : "Mechanic"]


namesOfIntegers = [:]

var airports = ["YYZ" : "Toronto Pearson", "DUB" : "Dublin"]

// Accessing and modifying a Dictionary

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

if let removedValue = airports.removeValueForKey("DUB"){
    print("The removed airport name is \(removedValue)")
}

// Iterating

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


/* ********************************************************************* */
/*                               OPTIONALS                               */
/* ********************************************************************* */

// Sets are unordered collections of unique values


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

// optional binding.....

if let actualNumber = Int(numberString){
    
    print("\"\(numberString)\" has an integer value of \(actualNumber)")
}


if let firstNumber = Int("4"), let secondNumber = Int("42") where firstNumber < secondNumber{
    
    print("\(firstNumber) < \(secondNumber)")
}

// implicitely unwrapped optional

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "An implicitely unwrapped optional string"
let implicitString: String = assumedString

// you can still check an implicitely unwrapped optional for nil (why!!!!!! Isn't it garanteed to not be nil?)

if assumedString != nil {
    print(assumedString)
}

if let definiteString = assumedString{
    print(definiteString)
}



/* ********************************************************************************** */
/* ********************************************************************************** */
/*                                BASIC OPERATORS                                     */
/* ********************************************************************************** */
/* ********************************************************************************** */

// Assignment Operator

let b = 10
var a = 5
a = b
let (x, y) = (1, 2)

// Arithmetic operators

var m = 1 + 2       // equals 3
m = 5 - 3       // equals 2
m = 2 * 3       // equals 6
var n = 10.0 / 2.5  // equals 4.0


let helloWorld = "hello, " + "world"


// Remainder operator

m = 9 % 4    // equals 1
m = -9 % 4   // equals -1
n = 8 % 2.5   // equals 0.5

// Unary minus operator

let three2 = 3
let minusThree = -three2
let plusThree = -minusThree

// Unary plus operator

let minusSix = -6
let alsoMinusSix = +minusSix

// Compound assignment operators

var aa = 1
aa += 2

// Comparison operators

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

// works with tupples

(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")


// Ternary conditional operators

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)


// Nil Coalescing Operator

let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName


// Range operators

for index in 1...5 { // closed range
    print("\(index) times 5 is \(index * 5)")
}

let names = ["Anna", "Alex", "Brian", "Jack"]
for i in 0..<names.count{
    print("Person \(i + 1) is called \(names[i])")
}

// Logical operators

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





/* ********************************************************************************** */
/* ********************************************************************************** */
/*                                  CONTROL FLOWS                                     */
/* ********************************************************************************** */
/* ********************************************************************************** */


/* ********************************************************************* */
/*                              FOR LOOPS                                */
/* ********************************************************************* */


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




/* ********************************************************************* */
/*                               WHILE LOOPS                             */
/* ********************************************************************* */


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
var board = [Int](count: finalSquare + 1, repeatedValue: 0)

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


/* ********************************************************************* */
/*                             IF STATEMENTS                             */
/* ********************************************************************* */

let temperatureInFahrenheit = 72

if temperatureInFahrenheit <= 32 {
    print("It's very cold")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm")
}


/* ********************************************************************* */
/*                         SWITCH STATEMENTS                             */
/* ********************************************************************* */

/*
 Considerably more powerful than its counterparts in many C-like languages.
 
 - Can match different patterns like interval matches, tuples, and casts to a specific type
 - Values can be bound to a temporary constant/variable for use within the case's body
 * complex matching conditions can be expressed using the where clause
 
 
 
 */




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

// interval matching

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


// Tuples

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

// value bindings

let anotherPoint = (2, 0)

switch anotherPoint {
    
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case(0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y)")
    
    
}

// where clause


let yetAnotherPoint = (1, -1)

switch yetAnotherPoint{
    
case let (x, y) where x == y:
    print("(\(x), \(y) is on the line x == y)")
case let (x, y) where x == -y:
    print("(\(x), \(y) is on the line x == -y)")
case let (x, y):
    print("(\(x), \(y) is just some arbitrary point)")
    
}


/* ********************************************************************* */
/*                       CONTROL TRANSFER STATEMENTS                     */
/* ********************************************************************* */


// Continue


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

// Break

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


// Fallthrough


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

// Statement label


let finalSquare2 = 25
var board2 = [Int](count: finalSquare2 + 1, repeatedValue: 0)

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


// Early exit

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

greet(["name" : "John"])


// Checking API availaility

if #available(iOS 9, OSX 10.10, *){
    
    
} else {
    
    
}


