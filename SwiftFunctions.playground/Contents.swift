/*:
# I. Functions
*/
func greet(name: String, day: String) -> String
{
    return "Hello \(name), today is \(day):"
}

greet(name: "Blob", day: "Tuesday")
/*:
## 1. Tupple as return value
*/
let lnI1 = #line
func calculateStatistics (scores: [Int]) -> (min: Int, max: Int, sum: Int)
{
    var min = scores [0]
    var max = scores [0]
    var sum = 0
    
    for score in scores
    {
        if score > max
        {
            max = score
        }
        else if score < min
        {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])

print(statistics.sum)
print(statistics.2)
/*:
## 2. Optional tupple return type
*/
let lnI2 = #line
func minMax(array: [Int]) -> (min: Int, max: Int)?{
    
    if array.isEmpty{
        return nil
    }
    else{
        
        var currentMin = array[0]
        var currentMax = array[0]
        
        for value in array[1..<array.count]{
            if value < currentMin {
                currentMin = value
            }
            else if value > currentMax {
                currentMax = value
            }
        }
        
        return (currentMin, currentMax)
    }
}

if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
/*:
## 3. Function parameter names
*/
let lnI3 = #line
func someFunction( firstParam: Int, secondparam: Int){
    // Do something
}

someFunction(firstParam: 1, secondparam: 2)
/*:
### a. External parameter names
*/
let lnI3a = #line
func someFunction2(externalParamName localParamName: Int, secondParam: Int){
    
    // Something
}

someFunction2(externalParamName: 1, secondParam: 2)

func sayHello (to person: String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)"
}

print(sayHello(to: "Bob", and: "Bill"))
/*:
### b. Omitting external parameter names
*/
let lnI3b = #line
func someFunction3 (_ firstParameter: Int, _ secondParameter: Int) {
    // something
}

someFunction3(2, 3)
/*:
## 4. Default parameter value
*/
let lnI4 = #line
func addTwo (input: Int = 12) -> Int {
	
    return input + 2
}

let result = addTwo()

print("Did I get my result \(result)")
/*:
## 5. Var args as param
*/
let lnI5 = #line
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    
    for number in numbers
    {
        sum += number
    }
    
    return sum
}

sumOf()
sumOf(numbers: 42, 597, 12)
/*:
## 6. In-Out parameter
*/
let lnI6 = #line
func swapTwoInts (_ a: inout Int, _ b:inout Int){
    
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)

print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
/*:
## 7. Function types
*/
let lnI7 = #line
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts (a: Int, _ b: Int) -> Int {
    return a * b
}


var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts

print("Results: \(mathFunction(2, 3))")

let anotherMathFunction = addTwoInts
/*:
### a. Function types as parameter types
*/
let lnI7a = #line
func printMathResult (mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    
    print("Result: \(mathFunction(a, b))")
}

printMathResult(mathFunction: addTwoInts, 2, 3)

func hasAnyMatches (list: [Int], condition: (Int) -> Bool) -> Bool  // so legible!!!!!
{
    for item in list
    {
        if condition (item)
        {
            return true
        }
    }
    
    return false
}

func lessThanTen (number: Int) -> Bool
{
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)
/*:
### b. Function types as return types
*/
let lnI7b = #line
func makeIncrementer() -> ((Int) -> Int)
{
    func addOne (number:Int) -> Int
    {
        return 1 + number
    }
    
    return addOne
}

var increment = makeIncrementer()

increment(7)

func stepForward (input: Int) -> Int {
    
    return input + 1
}

func stepBackwards (input: Int) -> Int {
    
    return input - 1
}

func chooseStepFunction (backwards: Bool) -> (Int) -> Int {
    
    return backwards ? stepBackwards : stepForward
}

var currentValue = 3

let moveNearerToZero = chooseStepFunction(backwards: currentValue > 0)

print("Counting to zero:")

while currentValue != 0 {
	
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}

print("zero!")
/*:
## 8. Nested functions
This is the equivalent to declaring a block and using it in a function ???
*/
let lnI8 = #line
func returnFifteen() -> Int {
    var y = 10
    
    func add() {
        y += 5
    }
    add()
    return y
}

returnFifteen()
/*:
# II. Closures
Swift’s closure expressions have a clean, clear style, with optimizations that encourage brief, clutter-free syntax in common scenarios. These optimizations include:

* Inferring parameter and return value types from context
* Implicit returns from single-expression closures
* Shorthand argument names
* Trailing closure syntax
## 1. Sort
 Swift’s standard library provides a method called sort(), which sorts an array of values of a known type, based on the output of a sorting closure that you provide. Once it completes the sorting process, the sort() method returns a new array of the same type and size as the old one, with its elements in the correct sorted order. The original array is not modified by the sort() method.
### a. Providing the sorting closure as a function
 */
let lnII1a = #line
var names1 = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, _ s2:String) -> Bool{
    
    return s1>s2
	
}

var reversed = names1.sorted(by: backwards)
/*:
### b. Providing the sorting closure in closure expression
*/
let lnII1b = #line
reversed = names1.sorted(by: {(s1:String, s2:String) -> Bool in
	
    return s1 > s2
})


reversed = names1.sorted(by: {s1, s2 in return s1 > s2}) // type inference (from the names1 array)

reversed = names1.sorted(by: {s1, s2 in s1 > s2}) //Single-expression closures can implicitly return the result of their single expression by omitting the return keyword

reversed = names1.sorted(by: {$0 > $1}) // shorthand argument names

reversed = names1.sorted(by: >) //string-specific implementation of the greater-than operator (>) as a function that has two parameters of type String, and returns a value of type Bool.
/*:
## 2. Trailing closures
*/
let lnII2 = #line
func someFunctionThatTakesAClosure( closure: () -> Void){
	
    // function implementation
}

someFunctionThatTakesAClosure(closure: {
    
    // closure body goes here
})

someFunctionThatTakesAClosure(){
    
    // trailing closure body goes here
}

reversed = names1.sorted() {
    $0 > $1
    
}
/*:
## 3. Map
Swift’s Array type has a map(_:) method which takes a closure expression as its single argument. The closure is called once for each item in the array, and returns an alternative mapped value (possibly of some other type) for that item. The nature of the mapping and the type of the returned value is left up to the closure to specify.
*/
let lnII3 = #line
let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]

let numbers1 = [16, 58, 510]

let numberStrings = numbers1.map{ (number) -> String in

    var number = number
    var output = ""
    while number > 0{
        
        output = digitNames[number % 10]! + output
        number /= 10
    }
    
    return output
}
/*:
## 4. Capturing values
*/
let lnII4 = #line
func makeIncrementer (forIncrement amount: Int) -> () -> Int {
    
    var runningTotal = 0
    
    func incrementer() -> Int {
        
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
}

let incrementByTen = makeIncrementer (forIncrement: 10)

incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
/*:
## 5. Closures as reference types
*/
let lnII5 = #line
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
/*:
##  6. Escaping closures
*/
let lnII6 = #line
func someFunctionWithNoneescapingClosure ( closure: () -> Void) {
    closure()
}
/*:
The way a closure passed as a param would be allowed to escape is if it's stored in a variable outside of the scope of the function its passed into as a parameter
*/
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure (completionHandler: @escaping ()-> Void){
    completionHandlers.append(completionHandler)
}
/*:
Marking a closure with @noescape lets you refer to self implicitly within the closure
*/
class SomeClass {
    
    var x = 10
    func doSomething() {
        
        someFunctionWithEscapingClosure {self.x = 100}
        someFunctionWithNoneescapingClosure { x = 200 }
        
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()

print(instance.x)
/*:
## 7. Autoclosures
*/
let lnII7 = #line
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = {customersInLine.remove(at: 0)}
print(customersInLine.count)

print("Now serving \(customerProvider())!")

print(customersInLine.count)

func serveCustomer (customerProvider: () -> String) {
    
    print("Now serving \(customerProvider())!")
}

serveCustomer(customerProvider: { customersInLine.remove(at: 0)})
/*:
The @autoclosure qualifier lets you pass the closure as if it was a string (WTH for????)
*/
func serve(customer customerProvider: @autoclosure () -> String) {
	print("Now serving \(customerProvider())!")
}

serve(customer: customersInLine.remove(at: 0))

/*:
# III. Methods
*/
let lnIII = #line
class Counter {
    
    var count = 0
    func increment() {
        
        count += 1
    }
    
    func incrementBy(amount: Int){
        count += amount
    }
    
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.incrementBy(amount: 5)
counter.reset()
/*:
## 1. Mutating instance methods
*/
let lnIII1 = #line
struct Point {
    
    var x = 0.0, y = 0.0
    
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        
        x += deltaX
        y += deltaY
    }
    
    mutating func moveByX2 (deltaX: Double, y deltaY: Double) {
        
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveByX(deltaX: 2.0, y: 3.0)
/*:
Structs declared as constants cannot be mutated, classes can....
## 2. Mutating func for an enum
*/
let lnIII2 = #line
enum TriStateSwitch {
    
    case Off, Low, High
    mutating func next() {
        
        switch self {
            
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
            
        }
    }
}

var overLight = TriStateSwitch.Low

overLight.next()
overLight.next()
/*:
## 3. Type methods
 Type methods are declared using the 'static' keyword. Except for classes where the 'class' keyword should be used to allow subclasses to override.
*/
let lnIII3 = #line
class SomeClass2 {
    
    static let sharedInstance: SomeClass2 = SomeClass2()
    class func someTypeMethod() {
		
    }
}

SomeClass2.someTypeMethod()
//doing a singleton just for fun

let singleton = SomeClass2.sharedInstance
/*:
## 4. Simple state machine
*/
let lnIII4 = #line
struct LevelTracker {
    
    static var highestUnlockedLevel = 1
	
    static func unlockLevel (level: Int){
        
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func levelIsUnlocked (level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    var currentLevel = 1
    
    mutating func advanceToLevel (level: Int) -> Bool {
        
        if LevelTracker.levelIsUnlocked(level: level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    
    var tracker = LevelTracker()
    
    let playerName: String
    
    func completedLevel (level: Int) {
        LevelTracker.unlockLevel(level: level + 1)
        tracker.advanceToLevel(level: level + 1)
    }
    
    init(name: String){
        playerName = name
    }
}


var player = Player(name: "Joey")
player.completedLevel(level: 1)

print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Bill")

if player.tracker.advanceToLevel(level: 6){
    print("print success")
} else {
    print("level 6 has not yet been unlocked")
}
/*:
# IV. Subscripts
drop the 'get' keyword to make a subscript read only
*/
let lnIV = #line
struct TimesTable {
    
    let multiplier: Int
    
    subscript (index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
/*:
## 1. Subscripts options
Subscripts can take any number of input parameters, and these input parameters can be of any type. Subscripts can also return any type. Subscripts can use variable parameters and variadic parameters, but cannot use in-out parameters or provide default parameter values.

A class or structure can provide as many subscript implementations as it needs, and the appropriate subscript to be used will be inferred based on the types of the value or values that are contained within the subscript brackets at the point that the subscript is used. This definition of multiple subscripts is known as subscript overloading.
*/
let lnIV1 = #line
struct Matrix {
    
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int){
        
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
        
    }
    
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        
        get {
            assert(indexIsValidForRow(row: row, column: column), "Index out of range")
		
            return grid[(row * column) + column]
        }
        
        set{
            assert(indexIsValidForRow(row: row, column: column), "Index out of range")
            grid[(row * column) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix [1, 0] = 3.2


enum TopLevel {
	case functions (FunctionsSection)
	case closures (ClosuresSection)
	case methods (MethodsSection)
	case subscripts (SubscriptsSection)
}

enum FunctionsSection {
	case tupple_Return_Value
	case optional_Return_Value
	case param_Names (ParamNamesSection)
	case default_Param_Value
	case var_Args_As_Param
	case inout_Param
	case function_Types (FunctionTypesSection)
	case nested
}

enum ParamNamesSection {
	case external
	case omitted
}

enum FunctionTypesSection {
	case as_Param
	case as_Return_Values
}

enum ClosuresSection {
	case sort (SortSection)
	case trailing
	case map
	case capturing_Values
	case as_Reference_Types
	case escaping
	case autoClosures
}

enum SortSection {
	case asFunction
	case asClosure
}

enum MethodsSection {
	case mutating
	case mutating_For_Enum
	case typeMethods
	case stateMachine
}

enum SubscriptsSection {
	case options
}

func tableOfContent(with input: TopLevel) -> Int {
	switch input {
	case .functions(let functions):
		switch functions {
		case .tupple_Return_Value:
			return lnI1
		case .optional_Return_Value:
			return lnI2
		case .param_Names (let paramNames):
			switch paramNames {
			case .external:
				return lnI3a
			case .omitted:
				return lnI3b
			}
		case .default_Param_Value:
			return lnI4
		case .var_Args_As_Param:
			return lnI5
		case .inout_Param:
			return lnI6
		case .function_Types (let functionTypes):
			switch functionTypes {
			case .as_Param:
				return lnI7a
			case .as_Return_Values:
				return lnI7b
			}
		case .nested:
			return lnI8
		}
	case .closures(let closures):
		switch closures {
		case .sort (let sort) :
			switch sort {
			case .asFunction:
				return lnII1a
			case .asClosure:
				return lnII1b
			}
		case .trailing:
			return lnII2
		case .map:
			return lnII3
		case .capturing_Values:
			return lnII4
		case .as_Reference_Types:
			return lnII5
		case .escaping:
			return lnII6
		case .autoClosures:
			return lnII7
		}
	case .methods(let methods):
		switch methods {
		case .mutating:
			return lnIII1
		case .mutating_For_Enum:
			return lnIII2
		case .typeMethods:
			return lnIII3
		case .stateMachine:
			return lnIII4
		}
	case .subscripts(let subscripts):
		switch subscripts {
		case .options:
			return lnIV1
		}
	}
}


//TABLE OF CONTENT

//	I. FUNCTIONS
//		1. Tupple as return value
		tableOfContent(with: .functions(.tupple_Return_Value))
//		2. Optional tupple return type
		tableOfContent(with: .functions(.optional_Return_Value))
//		3. Function parameter names
//			a. External parameter names
			tableOfContent(with: TopLevel.functions(.param_Names(.external)))
//			b. Omitting external parameter names
			tableOfContent(with: TopLevel.functions(.param_Names(.omitted)))
//		4. Default parameter value
		tableOfContent(with: TopLevel.functions(.default_Param_Value))
//		5. Var args as param
		tableOfContent(with: TopLevel.functions(.var_Args_As_Param))
//		6. In-Out parameter
		tableOfContent(with: TopLevel.functions(.inout_Param))
//		7. Function types
//			a. Function types as parameter types
			tableOfContent(with: TopLevel.functions(.function_Types(.as_Param)))
//			b. Function types as return types
			tableOfContent(with: TopLevel.functions(.function_Types(.as_Return_Values)))
//		8. Nested functions
		tableOfContent(with: TopLevel.functions(.nested))
//	II. CLOSURES
//		1. Sort
//			a. Providing the sorting closure as a function
			tableOfContent(with: TopLevel.closures(.sort(.asFunction)))
//			b. Providing the sorting closure in closure expression
			tableOfContent(with: TopLevel.closures(.sort(.asClosure)))
//		2. Trailing closures
		tableOfContent(with: TopLevel.closures(.trailing))
//		3. Map
		tableOfContent(with: TopLevel.closures(.map))
//		4. Capturing values
		tableOfContent(with: TopLevel.closures(.capturing_Values))
//		5. Closures as reference types
		tableOfContent(with: TopLevel.closures(.as_Reference_Types))
//		6. Escaping closures
		tableOfContent(with: TopLevel.closures(.escaping))
//		7. Autoclosures
		tableOfContent(with: TopLevel.closures(.autoClosures))
//	III. METHODS
//		1. Mutating instance methods
		tableOfContent(with: TopLevel.methods(.mutating))
//		2. Mutating func for an enum
		tableOfContent(with: TopLevel.methods(.mutating_For_Enum))
//		3. Type methods
		tableOfContent(with: TopLevel.methods(.typeMethods))
//		4. Simple state machine
	tableOfContent(with: TopLevel.methods(.stateMachine))
//	IV. SUBSCRIPTS
//		1. Subscripts options
		tableOfContent(with: TopLevel.subscripts(.options))
