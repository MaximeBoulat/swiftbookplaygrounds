//: Playground - noun: a place where people can play

import UIKit

//:# I. Enums
//:## 1. Declaration
let lnI1 = #line
enum Rank: Int {
    
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String{
        
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}


let ace = Rank.Ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 3)
{
    let threeDescription = convertedRank.simpleDescription()
}


enum Suit {
    
    case Spades, Hearts, Diamonds, Clubs
    
    func simpleDescription() -> String{
        
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

enum ServerResponse{
	
    case Result (String, String)
    case Failure (String)
}
//: This explains why the value of a enum case is not the same as its rawValue
let success = ServerResponse.Result ("6:00 am", "8:09 pm")
let failure = ServerResponse.Failure("Out of cheese")

enum CompassPoint {
    
    case North
    case South
    case East
    case West
}

enum Planet {
    
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var directionToHead = CompassPoint.West
directionToHead = .East

switch directionToHead {
    
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out for penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}
//: If not all cases are covered the switch statement needs a default case
let somePlanet = Planet.Earth

switch somePlanet {
    
case .Earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
/*:
 You can define Swift enumerations to store associated values of any given type, and the value types can be different for each case of the enumeration if needed
 */
enum Barcode {
    
    case UPCA (Int, Int, Int, Int)
    case QRCode (String)
}

var productBarCode =  Barcode.UPCA(8,  85909, 51226, 3)
productBarCode = .QRCode("ABCDEFGH")
//:## 2. Associated values extraction
let lnI2 = #line
switch success {
	
case let .Result(sunrise, sunset):
	print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .Failure(message):
	print("Failure... \(message)")
	
}

switch productBarCode {
    
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case .QRCode (let productCode):
    print("QR Code: \(productCode).")
    
}
//: or ...

switch productBarCode {
    
case let .UPCA (numberSystem, manufacturer, product, check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .QRCode (productCode):
    print("QR code: \(productCode).")
    
}

//:## 3. Raw values
let lnI3 = #line
enum ASCIICOntrolCharacter: Character {
    
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

enum Planet2: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Staurn, Uranus, Neptune
}

enum CompassPoint2: String {
    case North, South, East, West
}

let eartsOrder = Planet2.Earth.rawValue
let sunsetDirection = CompassPoint2.West.rawValue
//:## 4. Initializing from a raw value
let lnI4 = #line
let possiblePlanet = Planet2(rawValue: 7)

let positionToFind = 11

if let somePlanet = Planet2(rawValue: positionToFind) {
    
    switch somePlanet{
    case .Earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
}else{
    print("There isn't a planet at position \(positionToFind)")
}

//:## 5. Recursive Enumerations
let lnI5 = #line
enum ArithmeticExpression {
    
    case Number (Int)
    indirect case Addition (ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication (ArithmeticExpression, ArithmeticExpression)
}

indirect enum ArithmeticExpression2 {
    
    case Number (Int)
    case Addition (ArithmeticExpression, ArithmeticExpression)
    case Multiplication (ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))

func evaluate(expression: ArithmeticExpression) -> Int {
    
    switch expression {
    case let .Number(value):
        return value
    case let .Addition(left, right):
        return evaluate(expression: left) + evaluate(expression: right)
    case let .Multiplication (left, right):
        return evaluate (expression: left) * evaluate(expression: right)
    }
}

print(evaluate(expression: product))
//:## 6. Failable initializers
let lnI6 = #line
enum TemperatureUnit {
	case kelvin, celsius, fahrenheit
	
	init? (symbol: Character) {
		switch symbol {
		case "K":
			self = .kelvin
		case "C":
			self = .celsius
		case "F":
			self = .fahrenheit
		default:
			return nil
		}
	}
}
let fahrenheight = TemperatureUnit(symbol: "F")
if fahrenheight != nil {
	print("This is a defined temperature unit")
}

let unknown = TemperatureUnit(symbol: "T")
if unknown == nil {
	print("initialization failed")
}
//:## 7. Failable initializers with raw values
let lnI7 = #line
enum TemperatureUnit2: Character {
	case kelvin = "K", celsius = "C", farenheit = "F"
}

let farenheightUnit = TemperatureUnit2(rawValue: "F")
let unknownUnit = TemperatureUnit2(rawValue: "X")
//:# II. Structs
//:## 1. Declaration
let lnII1 = #line
//: Classes are passed by reference whereas structs are passed by value

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

//: an 'instance' of an enum case...................

struct Resolution {
    
    var width = 0
    var height = 0
}
//:## 2. Initialization
let lnII2 = #line
let someResolution = Resolution()

struct Farenheit {
	
	var temperature: Double
	
	init() {
		temperature = 32.0
	}
}

var f = Farenheit()
print("The default temperature is \(f.temperature) Farenheit")
//:## 3. Customizing Initialization
let lnII3 = #line
struct Celsius {
	
	var temperatureInCelsius: Double
	
	init(fromFarenheit farenheit: Double) {
		temperatureInCelsius = (farenheit - 32.0) / 1.8
	}
	
	init (fromKelvin kelvin: Double) {
		temperatureInCelsius = kelvin - 273.15
	}
	
	init (_ celsius: Double) {   // no external param label
		temperatureInCelsius = celsius
	}
}

let boilingPointOfWater = Celsius(fromKelvin: 212.0)
let freezingPointOfWater = Celsius(fromKelvin:  273.15)

//:## 4. Memberwise Initializers
let lnII4 = #line
let vga = Resolution(width: 640, height: 480)
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

struct Size {
	var width = 0.0, height = 0.0
}

let twoByTwo = Size(width: 2.0, height: 2.0)
//:## 5. Initializer delegation
let lnII5 = #line
struct Size2 {
	var width = 0.0, height = 0.0
}

struct Point2 {
	var x = 0.0, y = 0.0
}

struct Rect2 {
	
	var origin = Point2()
	var size = Size2()
	
	init() {}
	
	init(origin: Point2, size: Size2) {
		self.origin = origin
		self.size = size
	}
	
	init(center: Point2, size: Size2) {
		let originX = center.x - (size.width/2)
		let originY = center.y - (size.height/2)
		self.init(origin: Point2(x: originX, y: originY), size: size)
	}
}

let basicRect = Rect2()
let originRect = Rect2(origin: Point2(x: 2.0, y: 2.0), size: Size2(width: 5.0, height: 5.0))
let centerRect = Rect2(center: Point2(x: 4.0, y: 4.0), size: Size2(width: 3.0, height: 3.0))
//:## 6. Failable initializers
let lnII6 = #line
struct Animal {
	
	let species: String
	init? (species: String) {
		if species.isEmpty { return nil }
		self.species = species
	}
}

let someCreature = Animal(species: "Giraffe")

if let giraffe = someCreature {
	print("an animal was initialized with species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")

if anonymousCreature == nil {
	print("The anonymous creature could not be initialized")
}

//:## 7. Stored properties
let lnII7 = #line
/*:
The example below defines a structure called FixedLengthRange, which describes a range of integers whose range length cannot be changed once it is created 
*/
struct FixedLengthRange {
    
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
/*: If you create an instance of a structure and assign that instance to a constant, you cannot modify the instance’s properties, even if they were declared as variable properties  */
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6
//:## 8. Computed properties
let lnII8 = #line
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = CGSize()
    var center: Point {
        get {
            let centerX = origin.x + Double(size.width / 2)
            let centerY = origin.y + Double(size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set{
            origin.x = newValue.x - Double(size.width / 2)
            origin.y = newValue.y - Double(size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0),
                     size: CGSize(width: 10.0, height: 10.0))

let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)

print("square origin is not at \(square.origin.x), \(square.origin.y)")
//:## 9. Read-Only Computed Properties
let lnII9 = #line
//: You can simplify the declaration of a read-only computed property by removing the get keyword and its braces

struct Cuboid {
    
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double{
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("The volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
//:## 10. Type properties
let lnII10 = #line
//: Basically class variables
//: See below for Enums and Classes examples

/*:
 Unlike stored instance properties, you must always give stored type properties a default value. This is because the type itself does not have an initializer that can assign a value to a stored type property at initialization time.
 
 Stored type properties are lazily initialized on their first access. They are guaranteed to be initialized only once, even when accessed by multiple threads simultaneously, and they do not need to be marked with the lazy modifier.
 */

//: Xref: SwiftFunctions III.3.
struct SomeStructure {
    
    static var storedTypeProperty = "Some value."
    
    static var computedTypeProperty: Int {
        return 1
    }
}

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another Value."

struct AudioChannel {
    
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    
    var currentLevel: Int = 0 {
        didSet {
            if  currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
			}
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

//:# III. Classes

class VideoMode {

    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
//:## 1. Initialization
let lnIII1 = #line
let someVideoMode = VideoMode()
//:## Accessing variables with dot syntax
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280

print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

class SurveyQuestion {
	
	let text: String
	var response: String?
	
	/*
	You can assign a value to a constant property at any point during initialization, as long as it is set to a definite value by the time initialization finishes. Once a constant property is assigned a value, it can’t be further modified.
	*/
	
	init (text: String) {
		self.text = text
	}
	
	func ask() {
		print(text)
	}
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()

cheeseQuestion.response = "Who doesn't"

/*:
Swift provides a default initializer for any structure or class that provides default values for all of its properties and does not provide at least one initializer itself. The default initializer simply creates a new instance with all of its properties set to their default values.
*/

class ShoppingListItem {
	var name: String?
	var quantity = 1
	var purchased = false
}

var item = ShoppingListItem()

//:## 2. Classes as reference types and the identity operator
let lnIII2 = #line
let tenEighty = VideoMode()
tenEighty.resolution = Resolution(width: 1920, height: 1080)
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same instance")
}

//:## 3. Lazy stored properties
let lnIII3 = #line
class DataImporter{
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

print(manager.importer.fileName)
//:## 4. Property observers
let lnIII4 = #line
class StepCounter {
    
    var totalSteps: Int = 0 {
        willSet (newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
		}
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
//:## 5. Type properties
let lnIII5 = #line
//: Basically class variables

class SomeClass {
    
    static var storedTypeProperty = "Some value."
    
    static var computedTypeProperty: Int {
        return 27
    }
    
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeClass.computedTypeProperty)

//:## 6. Inheritance
let lnIII6 = #line
/*:
 Designated initializers are inherited from the superclass (can be overridden?).
 Variables stored in the subclass must be instantiated before the designated initializer is called on super.
 Convenience initializers are taylored to the subclass.
 */

class Vehicle {
    
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        // to override
    }
}

class Bicycle: Vehicle {
    var hasBasket = false
}

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0

print ("Tandem: \(tandem.description)")
//:## 7. Overriding
let lnIII7 = #line
class Train: Vehicle {
    
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    
    var gear = 1
    
    override var description: String {
        return super.description + "in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3

print("Car: \(car.description)")

class AutomaticCar: Car {
    
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0)
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("Automatic Car: \(automatic.description) with current speed: \(automatic.currentSpeed)")
//:## 8. Preventing overrides
let lnIII8 = #line
/*: use the final qualifier */

//:## 9. Initialization and inheritance
let lnIII9 = #line
/*:
Rule 1
A designated initializer must call a designated initializer from its immediate superclass.

Rule 2
A convenience initializer must call another initializer from the same class.

Rule 3
A convenience initializer must ultimately call a designated initializer.

Safety check 1
A designated initializer must ensure that all of the properties introduced by its class are initialized before it delegates up to a superclass initializer.

Safety check 2
A designated initializer must delegate up to a superclass initializer before assigning a value to an inherited property. If it doesn’t, the new value the designated initializer assigns will be overwritten by the superclass as part of its own initialization.

Safety check 3
A convenience initializer must delegate to another initializer before assigning a value to any property (including properties defined by the same class). If it doesn’t, the new value the convenience initializer assigns will be overwritten by its own class’s designated initializer.


Safety check 4
An initializer cannot call any instance methods, read the values of any instance properties, or refer to self as a value until after the first phase of initialization is complete.

Phase 1

A designated or convenience initializer is called on a class.
Memory for a new instance of that class is allocated. The memory is not yet initialized.
A designated initializer for that class confirms that all stored properties introduced by that class have a value. The memory for these stored properties is now initialized.
The designated initializer hands off to a superclass initializer to perform the same task for its own stored properties.
This continues up the class inheritance chain until the top of the chain is reached.
Once the top of the chain is reached, and the final class in the chain has ensured that all of its stored properties have a value, the instance’s memory is considered to be fully initialized, and phase 1 is complete.

Phase 2
Working back down from the top of the chain, each designated initializer in the chain has the option to customize the instance further. Initializers are now
able to access self and can modify its properties, call its instance methods, and so on.
Finally, any convenience initializers in the chain have the option to customize the instance and to work with self.


SO BASICALLY:

A designated initializer must ensure all the properties of the subclass are assigned values before calling the supercass' designated initializer.
After that the subclass is free to use self, read the values of its variables, and further set the values of its superclass variables.


If you want a custom subclass to present one or more of the same initializers as its superclass, you can provide a custom implementation of those initializers within the subclass.

When you write a subclass initializer that matches a superclass designated initializer, you are effectively providing an override of that designated initializer. Therefore, you must write the override modifier before the subclass’s initializer definition. This is true even if you are overriding an automatically provided default initializer, as described in Default Initializers.

As with an overridden property, method or subscript, the presence of the override modifier prompts Swift to check that the superclass has a matching designated initializer to be overridden, and validates that the parameters for your overriding initializer have been specified as intended.

*/

//: The following class gets a default initializer because it provides default values for all its stored properties
class Vehicle2 {
	
	var numberOfWheels = 0
	var description: String  {
		return "\(numberOfWheels) wheels"
	}
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")

class Bicycle2: Vehicle2 {
	
	override init() {
		super.init()
		
		numberOfWheels = 2
	}
}
/*:
Rules for inheriting designated initializers:

Rule 1
If your subclass doesn’t define any designated initializers, it automatically inherits all of its superclass designated initializers.

Rule 2
If your subclass provides an implementation of all of its superclass designated initializers—either by inheriting them as per rule 1, or by providing a custom implementation as part of its definition—then it automatically inherits all of the superclass convenience initializers.
*/
class Food {
	
	var name: String
	
	init(name: String) {
		/*
		Designated (because it ensures that stored properties are initialized).
		Does not need to call super because Food is not a subclass.
		*/
		self.name = name
	}
	
	convenience init() {  // convenience
		self.init( name: "[Unnamed]")
	}
}

let mysteryMeat = Food()

class RecipeIngredient: Food {
	
	var quantity: Int
	
	init(name: String, quantity: Int) {
		self.quantity = quantity
		super.init(name: name)
	}
	
	override convenience init( name: String) {
		// A convenience initializer which overrides the superclasses designated initializer. Since the subclass has overriden all of its superclass' designated initializers, it automatically inherits its convenience initializer
		self.init(name: name, quantity: 1)
	}
}

let oneMysteryitem = RecipeIngredient()
let oneBacon = RecipeIngredient()
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
/*:
Because it provides a default value for all of the properties it introduces and does not define any initializers itself, ShoppingListItem automatically inherits all of the designated and convenience initializers from its superclass.
*/
class ShoppingListItem2: RecipeIngredient {
	var purchased = false
	var description: String {
		var output = "\(quantity) x \(name)"
		output += purchased ? " ✔" : " ✘"
		return output
	}
}

var breakfastList = [
ShoppingListItem2(),
ShoppingListItem2(name: "Bacon"),
ShoppingListItem2(name: "Eggs", quantity: 6)
]

breakfastList[0].name = "Orange Juice"
breakfastList[0].purchased = true

for item in breakfastList{
	print(item.description)
}

//:## 10. Propagation of initializer failure
let lnIII10 = #line
class Product {
	
	let name: String
	
	init?(name: String) {
		if name.isEmpty { return nil }
		self.name = name
	}
}

class CartItem: Product {
	
	let quantity: Int
	
	init? (name: String, quantity: Int) {
		
		if quantity < 1 { return nil }
		self.quantity = quantity
		
		super.init(name: name)
	}
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
	print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirst", quantity: 0) {
	
}
else {
	print("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
	
}
else {
	print("Unable to initialize a unnamed product")
}

//:## 11. Overriding a Failable Initializer
let lnIII11 = #line
class Document {
	var name: String?
	
	init() {}
	
	init?(name: String) {
		if name.isEmpty { return nil }
		
		self.name = name
	}
}

class AutomaticallyNamedDocument: Document {
	
	override init() {
		super.init()
		
		self.name = "[Untitled]"
	}
	
	override init(name: String) {
		super.init()
		
		if name.isEmpty {
			self.name = "[Untitled]"
		}
		else {
			self.name = name
		}
	}
}

// force unwrapping a failable initializer of the superclass

class UntitledDocument: Document {
	
	override init() {
		super.init(name: "[Untitled]")!
	}
}

//:## 12. Required Initializers
let lnIII12 = #line
class SomeClass2 {
	required init() {
		
	}
}

class SomeSubclass: SomeClass2 {
	required init() {
		
	}
}

//:## 13. Setting a default property with a closure or a function
let lnIII13 = #line
struct Chessboard {
	
	let boardColors: [Bool] = {
		
		var temporaryBoard = [Bool]()
		var isBlack = false
		for i in 1...8 {
			for j in 1...8 {
				temporaryBoard.append(isBlack)
				isBlack = !isBlack
			}
			isBlack = !isBlack
		}
		return temporaryBoard
	}()
	
	func squareIsBlackAt (row: Int, column: Int) -> Bool {
		return boardColors[(row * 8) + column]
	}
}

let board = Chessboard()

print(board.squareIsBlackAt(row: 0, column: 1))
print(board.squareIsBlackAt(row: 7, column: 7))


//:## 14. Deinitialization
let lnIII14 = #line
class Bank {
	static var coinsInBank = 10_000
	
	static func distribute (coins numberOfCoinsRequested: Int) -> Int {
		let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
		coinsInBank -= numberOfCoinsToVend
		return numberOfCoinsToVend
	}
	
	static func receive(coins: Int) {
		coinsInBank += coins
	}
}

class Player {
	var coinsInPurse: Int
	
	init(coins: Int) {
		coinsInPurse = Bank.distribute(coins: coins)
	}
	
	func win(coins: Int) {
		coinsInPurse += Bank.distribute(coins: coins)
	}
	
	deinit {
		Bank.receive(coins: coinsInPurse)
	}
}

var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")
playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins and now has \(playerOne!.coinsInPurse)")
print("The bank now only has \(Bank.coinsInBank) coins left")

playerOne = nil
print("The bank now has \(Bank.coinsInBank) coins")

//:# IV. Automatic Reference Counting

class ApartmentUnit {
	let unit: String
	
	init(unit: String) {
		self.unit = unit
	}
	
	weak var tenant: Person?
	
	deinit {
		print("Apartment \(unit) is being deinitialized")
	}
}

class Person {
	
	let name: String
	init (name: String) {
		self.name = name
		print("\(name) is being initialized")
	}
	
	//Property observers aren’t called when ARC sets a weak reference to nil.
	var apartment: ApartmentUnit?
	
	deinit {
		print("\(name) is being deinitialized")
	}
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")

reference1 = nil
reference2 = nil
reference3 = nil

//:## 1. Strong reference Cycles between class instances
let lnIV1 = #line
var john: Person?
var unit4a: ApartmentUnit?

john = Person(name: "John Appleseed")
unit4a = ApartmentUnit(unit: "4A")

john!.apartment = unit4a
unit4a!.tenant = john

john = nil
unit4a = nil

// Unowned references are like weak references which are garanteed to never be nil, they are not nullified when the underlying instance deallocates

class Customer {
	let name: String
	var card: CreditCard?
	
	init(name: String) {
		self.name = name
	}
	
	deinit {
		print("\(name) is being deinitialized")
	}
}

class CreditCard {
	let number: UInt16
	unowned let customer: Customer
	
	init(number: UInt16, customer: Customer) {
		self.number	= number
		self.customer = customer
	}
	
	deinit {
		print("Card #\(number) is being deinitialized")
	}
}

var john1: Customer?
john1 = Customer(name: "John AppleSeed")
john1?.card = CreditCard(number: 123, customer: john1!)

john1 = nil

//:## 2. Unowned references and implicitly unwrapped optional properties
let lnIV2 = #line
class Country {
	
 let name: String
	var capitalCity: City!
	
	init(name: String, capitalName: String) {
		self.name = name
		self.capitalCity = City(name: capitalName, country: self)
	}
}

class City {
	let name: String
	unowned let country: Country
	
	init(name: String, country: Country) {
		self.name = name
		self.country = country
	}
}

var country = Country(name: "Canada", capitalName: "Ottawa")

print("\(country.name)'s capital city is called \(country.capitalCity.name)")

//:## 3. Strong reference cycles for closures (closure capture list)
let lnIV3 = #line
class HTMLElement {
	
	let name: String
	let text: String?
	
	// Why would you do that instead of using a method? Because you could can replace its default value (FOLLOW UP ON THIS PATTERN....)
	lazy var asHTML: () -> String = { [unowned self] in
		
		if let text = self.text {
			return "<\(self.name)><\(text)></\(self.name))>"
		}
		else {
			return "<\(self.name)/>"
		}
	}
	
	init(name: String, text: String? = nil) {
		self.name = name
		self.text = text
	}
	
	deinit {
		print("\(name) is being deinitialized")
	}
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello world")
print(paragraph!.asHTML)

paragraph = nil

//:# V. Optional Chaining
/*:
Optional chaining is a process for querying and calling properties, methods, and subscripts on an optional that might currently be nil
*/

//:## 1. Presentation
let lnV1 = #line
class Person2 {
	var residence: Residence?
}

class Residence {
	var numberOfRooms = 1
}

let john2 = Person2()

if let roomCount = john2.residence?.numberOfRooms {
	print("John's room has \(roomCount) room(s)")
}
else {
	print("unable to retrieve the number of rooms")
}

john2.residence = Residence()

if let roomCount = john2.residence?.numberOfRooms {
	print("John's room has \(roomCount) room(s)")
}
else {
	print("unable to retrieve the number of rooms")
}

class Person3 {
	var residence: Residence2?
}

class Residence2 {
	
	var rooms = [Room]()
	var numberOfRooms: Int {
		return rooms.count
	}
	
	subscript(i: Int) -> Room {
		get {
			return rooms[i]
		}
		set {
			rooms[i] = newValue
		}
	}
	
	func printNumberOfRooms() {
		
		/* This method does not specify a return type. However, functions and methods with no return type have an implicit return type of Void, as described in Functions Without Return Values. This means that they return a value of (), or an empty tuple. */

		print("The number of rooms is \(numberOfRooms)")
	}
	
	var address: Address?
	
	
}

class Room {
	let name: String
	init(name: String) {
		self.name = name
	}
}

class Address {
	
	var buildingName: String?
	var buildingNumber: String?
	var street: String?
	
	func buildingIdentifier() -> String? {
		if buildingName != nil {
			return buildingName
		}
		else if buildingName != nil && street != nil {
			return "\(buildingNumber) \(street)"
		}
		else {
			return nil
		}
	}
}

//:## 2. Accessing Properties
let lnV2 = #line
let fred = Person3()

// reading

if let roomcount = fred.residence?.numberOfRooms {
	print("John's residence has \(roomcount) rooms")
}
else {
	print("Unable to retrieve number of rooms")
}

// setting

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
fred.residence?.address = someAddress

func createAddress() -> Address {
	print("Function was called")
	
	let someAddress = Address()
	someAddress.buildingNumber = "29"
	someAddress.street = "Acacia Road"
	
	return someAddress
}

fred.residence?.address = createAddress()

//:## 3. Calling methods
let lnV3 = #line
// methods which have no return value actually return Void, and optional Void can be nil
if fred.residence?.printNumberOfRooms() != nil {
	print("It was possible to print the number of rooms")
}
else {
	print("It was not possible to print the number of rooms")
}

// Same goes with setting a property

if (fred.residence?.address = someAddress) != nil {
	print("It was possible to set the address")
}
else {
	print("It was not possible to set the address")
}

//:## 4. Accessing subscripts
let lnV4 = #line
// reading
if let firstRoomName = fred.residence?[0].name {
	print("The first room name is \(firstRoomName)")
}
else {
	print("Unable to retrieve the first room name")
}

// writing
fred.residence?[0] = Room(name: "Bathroom")

let fredsHouse = Residence2()
fredsHouse.rooms.append(Room(name: "Living Room"))
fredsHouse.rooms.append(Room(name: "Kitchen"))
fred.residence = fredsHouse

if let firstRoomName = fred.residence?[0] {
	print("The first room name is \(firstRoomName)")
}
else {
	print("Unable to retrieve the first room name")
}

//:## 5. Accessing subscripts of optional types
let lnV5 = #line
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72

//:## 6. Linking multiple levels of chaining
let lnV6 = #line
if let fredsstreet = fred.residence?.address?.street {
	print("John's street name is \(fredsstreet)")
}
else {
	print("Unable to retrieve the address")
}

//:## 7. Chaining on methods with optional return values
let lnV7 = #line
if let buildingIdentifier = fred.residence?.address?.buildingIdentifier() {
	print("fred's building identifier is \(buildingIdentifier)")
}

// further optional chaining on the optional return value

if let beginsWithThe = fred.residence?.address?.buildingIdentifier()?.hasPrefix("the") {
	if beginsWithThe {
		print("John's building identifier begins with The")
	}
	else {
		print("John's building identifier does not begin with The")
	}
}

let buildingIdentifier = fred.residence?.address?.buildingIdentifier()

//:# VI. Protocols
//:## 1. Declaration
let lnVI1 = #line
protocol ExampleProtocol {
	
    var simpleDescription: String {get}
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += " Now a 100 % adjusted."
    }
}

let ba = SimpleClass()
ba.adjust()
let bDescription = ba.simpleDescription

protocol FullyNamed {
	var fullName: String { get }
	
}

struct Person4: FullyNamed {
	var fullName: String
}

let Sam = Person4(fullName: "John Appleseed")

class Starship: FullyNamed {
	
	var prefix: String?
	var name: String
	init(name: String, prefix: String? = nil) {
		self.name = name
		self.prefix = prefix
	}
	
	var fullName: String {
		return (prefix != nil ? prefix! + " " : "") + name
	}
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")

//:## 2. Method requirements
let lnVI2 = #line
protocol RandomNumberGenerator {
	func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
	var lastRandom = 42.0
	let m = 139968.0
	let a = 3877.0
	let c  = 29573.0
	
	func random() -> Double {
		lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
		return lastRandom / m
	}
}

let generator = LinearCongruentialGenerator()
print("Here's a random number\(generator.random())")

//:## 3. Mutating method requirements
let lnVI3 = #line
protocol Toggable {
	mutating func toggle()
}

enum OnOffSwitch: Toggable {
	case off, on
	
	mutating func toggle() {
		switch self {
		case .off:
			self = .on
		case .on:
			self = .off
		}
	}
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

//:## 4. Protocols as Types
let lnVI4 = #line
class Dice {
	
	let sides: Int
	let generator: RandomNumberGenerator
	init(sides: Int, generator: RandomNumberGenerator) {
		self.sides = sides
		self.generator = generator
	}
	
	func roll() -> Int {
		return Int(generator.random() + Double(sides)) + 1
	}
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())

for _ in 0...5 {
	print("Random dice roll is \(d6.roll())")
}

//:## 5. Delegation
let lnVI5 = #line
protocol DiceGame {
	var dice: Dice { get }
	
	func play()
}

protocol DicegameDelegate {
	func gameDidStart(_ game: DiceGame)
	func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
	func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
	let finalSquare = 25
	let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
	var square = 0
	
	var board: [Int]
	
	init() {
		board = Array(repeating: 0, count: finalSquare + 1)
		board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
		board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
	}
	
	var delegate: DicegameDelegate?
	
	func play() {
		square = 0
		delegate?.gameDidStart(self)
		gameLoop: while square != finalSquare {
			let diceRoll = dice.roll()
			delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
			switch square + diceRoll {
			case finalSquare:
				break gameLoop
			case let newSquare where newSquare > finalSquare:
				continue gameLoop
			default:
				square += diceRoll
				square += board[square]
			}
		}
		delegate?.gameDidEnd(self)
	}
}

class DiceGameTracker: DicegameDelegate {
	var numberOfTurns = 0
	func gameDidStart(_ game: DiceGame) {
		numberOfTurns = 0
		if game is SnakesAndLadders {
			print("Started a new game of snakes and ladders")
		}
		
		print("The game is using a \(game.dice.sides)-sided dice")
	}
	
	func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
		numberOfTurns += 1
	}
	
	func gameDidEnd(_ game: DiceGame) {
		print("The game lasted for \(numberOfTurns) turns")
	}
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

//:## 6. Adding protocol conformance with an extension
let lnVI6 = #line
protocol TextRepresentable {
	var textualDescription: String { get }
}

extension Dice: TextRepresentable {
	var textualDescription: String {
		return "a \(sides)-sided dice"
	}
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)

extension SnakesAndLadders: TextRepresentable {
	var textualDescription: String {
		return "A game of snaes and ladders with \(finalSquare) squares"
	}
}

struct Hamster {
	var name: String
	var textualDescription: String {
		return "A hamster with name \(name)"
	}
}

extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")

//:## 7. Collections of protocol types
let lnVI7 = #line
let things: [TextRepresentable] = [game, d12, simonTheHamster]

for thing in things {
	print(thing.textualDescription)
}

//:## 8. Protocol Inheritance
let lnVI8 = #line
protocol PrettyTextRepresentable: TextRepresentable {
	var prettyTextualDescription: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
	
	var prettyTextualDescription: String {
		var output = textualDescription + ":\n"
		
		for index in 1...finalSquare {
			switch board[index] {
			case let ladder where ladder > 0:
				output += "▲ "
			case let snake where snake < 0:
				output += "▼ "
			default:
				output += "○ "
			}
		}
		return output
	}
}

print(game.prettyTextualDescription)

//:## 9. Class-only Protocols
let lnVI9 = #line
protocol SomeClassOnlyProtocol: class {
	// class only protocol definition goes here
}

//:## 10. Protocol Composition
let lnVI10 = #line
protocol Named {
	
	var name: String { get }
}

protocol Aged {
	
	var age: Int { get }
}

struct Person5: Named, Aged {
	var name: String
	var age: Int
}

func wishHappyBirthDay(to celebrator: Named & Aged) {
	print("Happy Birthday, \(celebrator.name), you're \(celebrator.age)")
}

let birthdayBoy = Person5(name: "Malcom", age: 21)
wishHappyBirthDay(to: birthdayBoy)

//:## 11. Checking for Protocol Conformance
let lnVI11 = #line
protocol HasArea {
	var area: Double { get }
}

class Circle: HasArea {
	let pi = 3.1415927
	var radius: Double
	
	var area: Double { return pi * radius * radius }
	
	init(radius: Double) {
		self.radius = radius
	}
}

class Country2: HasArea {
	var area: Double
	init(area: Double) {
		self.area = area
	}
}

class Animal2 {
	var legs: Int
	init (legs: Int){
		self.legs = legs
	}
}

let objects: [AnyObject] = [
	Circle(radius: 2.0),
	Country2(area: 243_986),
	Animal2(legs: 4)
]

for object in objects {
	if let objectWithArea = object as? HasArea {
		print("Area is \(objectWithArea.area)")
	}
	else {
		print("Something which has no area")
	}
}

//:## 12. Optional Protocol Requirements
let lnVI12 = #line
@objc protocol CounterDataSource {
	@objc optional func increment(forCount count: Int) -> Int
	@objc optional var fixedIncrement: Int { get }
}

class Counter {
	var count = 0
	var dataSource: CounterDataSource?
	func increment() {
		if let amount = dataSource?.increment?(forCount: count) {
			count += amount
		}
		else if let amount = dataSource?.fixedIncrement {
			count += amount
		}
	}
}

class ThreeSource: NSObject, CounterDataSource {
	let	 fixedIncrement: Int = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()

for _ in 1...4 {
	counter.increment()
	print(counter.count)
}

@objc class TowardsZeroSource: NSObject, CounterDataSource {
	func increment(forCount count: Int) -> Int {
		if count == 0 {
			return 0
		}
		else if count < 0 {
			return 1
		}
		else {
			return -1
		}
	}
}

counter.count = 4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
	counter.increment()
	print(counter.count)
}

//:## 13. Protocol Extensions
let lnVI13 = #line
extension Int: ExampleProtocol{
	
	var simpleDescription: String{
		return "The number \(self)"
	}
	
	mutating func adjust(){
		self += 42
	}
}

print(7.simpleDescription)

extension RandomNumberGenerator {
	func randomBool() -> Bool {
		return random() > 0.5
	}
}

let generator2 = LinearCongruentialGenerator()
print("Here's a random number: \(generator2.random())")
print("Here's a random bool : \(generator2.randomBool())")

// providing default implementation

extension PrettyTextRepresentable {
	var prettyTextualDescription: String {
		return textualDescription
	}
}

// adding constraints to protocol extensions

extension Collection where Iterator.Element: TextRepresentable {
	var textualDescription: String {
		let itemsAstext = self.map{ $0.textualDescription }
		return "[" + itemsAstext.joined(separator: ", ") + "]"
	}
}

let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]

print(hamsters.textualDescription)

//:# VII. Errors

//:## 1. Presentation
let lnVII1 = #line
enum PrinterError: Error {
    case OutOfPaper
    case NoToner
    case OnFire
}

func sendToPrinter (printerName: String) throws ->String{
    
    if printerName == "Never Has Toner"{
        throw PrinterError.NoToner
    }
    return "Job sent"
}

do {
	let printerResponse = try sendToPrinter(printerName: "Brother")
	
}
catch PrinterError.OnFire {
	print("I'll just put this over here, with the rest of the fire")
}
catch let printerError as PrinterError {
	print("Printer error: \(printerError)")
}
catch {
	print(error)
}

//: Use try? to return an optional

let printerSuccess = try? sendToPrinter(printerName: "Never Has Toner")

//: Use defer to provide a block which must always be executed before a method returns

var teaKettleHeating = false

func morningRoutine() throws{
    teaKettleHeating = true
    
    defer{
      teaKettleHeating = false
    }
	
    try sendToPrinter(printerName: "Never Has Toner")
}

do{
    try morningRoutine()
    
}catch{
    print(error)
}

enum VendingMachineError: Error {
    case invalidSelection
    case insuficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    
    var price: Int
    var count: Int
}

class VendingMachine {
    
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7 ),
        "Chips": Item(price:10, count: 4),
        "Pretzels": Item(price: 10, count: 11)
    ]
    
    var coinsDeposited = 0
    func dispenseSnack(snack: String){
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws{
        
        guard let item = inventory[name] else{
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else{
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else{
            throw VendingMachineError.insuficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        dispenseSnack(snack: name)
    }
}

let vendingMachine = VendingMachine()

do{
	try vendingMachine.vend(itemNamed: "Chips")
}catch let error as VendingMachineError{
	print(error)
}

/*:
 Because the vend(itemNamed:) method propagates any errors it throws, any code that calls this method must either handle the errors—using a do-catch statement, try?, or try!—or continue to propagate them. For example, the buyFavoriteSnack(_:vendingMachine:) in the example below is also a throwing function, and any errors that the vend(itemNamed:) method throws will propagate up to the point where the buyFavoriteSnack(_:vendingMachine:) function is called. */

let favoriteSnacks = [
    "Alice" : "Chips",
    "Bob" : "Liquorice",
    "Eve" : "Pretzels"
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    
    let snackName = favoriteSnacks [person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

do {
 try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
}
catch VendingMachineError.invalidSelection {
	print("Invalid Selection")
}
catch VendingMachineError.outOfStock {
	print("Out of Stock")
}
catch VendingMachineError.insuficientFunds (let coinsNeeded) {
	print("Insufficient funds. Please insert an additional \(coinsNeeded) coins)")
}

//:## 2. Converting errors to optional values
let lnVII2 = #line
try? buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)

//:## 3. Initializers as throwing functions
let lnVII3 = #line
struct PurchasedSnack{
    let name: String
	
    init(name: String, vendingMachine: VendingMachine) throws{
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

let purchasedSnackk = try? PurchasedSnack(name:"Chips", vendingMachine: vendingMachine)

//:## 4. Assertions
let lnVII4 = #line
let age = 3
assert(age >= 0, "A person's age cannot be less than zero")

//:# VIII. Type Casting
//:## 1. Checking type
let lnVIII1 = #line
class MediaItem {
	
	var name: String
	
	init(name: String) {
		self.name = name
	}
}

class Movie: MediaItem {
	
	var director: String
	init(name: String, director: String) {
		self.director = director
		super.init(name: name)
	}
}

class Song: MediaItem {
	var artist: String
	init(name: String, artist: String) {
		self.artist = artist
		super.init(name: name)
	}
}

// the type of library is infered to be [MediaItem]

let library = [
	Movie(name: "Casablanca", director: "Michael Curtiz"),
	Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
	Movie(name: "Citizen Kane", director: "Orson Welles"),
	Song(name: "The one and only", artist: "Chesney Hawkes"),
	Song(name: "Never gonna give you up", artist: "Rick Astley")
]

var movieCount = 0
var songCount = 0

for item in library {
	if item is Movie {
		movieCount += 1
	}
	else if item is Song {
		songCount += 1
	}
}

print("Media library contains \(movieCount) movies and \(songCount) songs")

//:## 2. Downcasting
let lnVIII2 = #line
for item in library {
	if let movie = item as? Movie {
		print("Movie is :\(movie.name)")
	}
	else if let song = item as? Song {
		print("Song is \(song.name)")
	}
}

//:## 3. Using Any and AnyObject
let lnVIII3 = #line
let someObjects: [AnyObject] = [
	Movie(name: "2001: A Space Odyssey", director: "Syanley Kubrik"),
	Movie(name: "Moon", director: "Duncan Jones"),
	Movie(name: "Alien", director: "Ridley Scott")
]

for object in someObjects {
	let movie = object as! Movie
	print("Movie is \(movie.name)")
}

// even better

for movie in someObjects as! [Movie] {
	print("the movie:\(movie.name)")
}

var things2 = [Any]()

things2.append(0)
things2.append(0.0)
things2.append(42)
things2.append(3.1416)
things2.append("hello")
things2.append((3.0, 5.0))
things2.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things2.append({(name: String) -> String in "Hello \(name)"})

for thing in things {
	switch thing {
	case 0 as Int:
		print("zero as an int")
	case 0 as Double:
		print("zero as Double")
	case let someInt as Int:
		print("an integer value of \(someInt)")
	case let someDouble as Double where someDouble > 0:
		print("a positive double of value \(someDouble)")
	case is Double:
		print("some other double value")
	case let someString as String:
		print("a string value of \(someString)")
	case let (x, y) as (Double, Double):
		print("An (x, y) point at \(x), \(y)")
	case let movie as Movie:
		print("a movie called \(movie.name)")
	case let stringConverter as (String) -> String:
		print(stringConverter("Michael"))
	default:
		print("something else")
	}
}

//:# IX. Nested Types
let lnIX = #line
struct BlackjackCard {
	
	enum Suit: Character {
		case spades = "♠"
		case hearts = "♡"
		case diamonds = "♢"
		case clubs = "♣"
	}
	
	// nested Rank enumeration
	enum Rank: Int {
		case two = 2, three, four, five, six, seven, eight, nine, ten
		case jack, king, queen, ace
		
		struct Values {
			let first: Int, second: Int?
		}
		
		var values: Values {
			switch self {
			case .ace:
				return Values(first: 1, second: 11)
			case .jack, .queen, .king:
				return Values(first: 10, second: nil)
			default:
				return Values(first: self.rawValue, second: nil)
			}
		}
	}
	
	let rank: Rank, suit: Suit
	var description: String {
		var output = "suit is \(suit.rawValue),"
		output += " value is \(rank.values.first)"
		if let second = rank.values.second {
			output += "or \(second)"
		}
		return output
	}
}

let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print("theAceOfSpades: \(theAceOfSpades.description)")

let heartsSymbol = BlackjackCard.Suit.hearts

//:# X. Extensions
/*: The ability to extend types for which you do not have access to the original source code is called retroactive modelling

Extensions in Swift can:

* Add computed instance properties and computed type properties
* Define instance methods and type methods
* Provide new initializers
* Define subscripts
* Define and use new nested types
* Make an existing type conform to a protocol*/

//:## 1. Computed Properties
let lnX1 = #line
extension Double {
	
	var km: Double { return self * 1_000.0 }
	var m: Double { return self }
	var cm: Double { return self / 100.0 }
	var mm: Double { return self / 1_000.0 }
	var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

//:## 2. Initializers
let lnX2 = #line
struct Size3 {
	var width = 0.0, height = 0.0
}

struct Point3 {
	var x = 0.0, y = 0.0
}

struct Rect3 {
	var origin = Point3()
	var size = Size3()
}

let defaultRect = Rect3()
let memberwiseRect = Rect3(origin: Point3(x: 2.0, y: 2.0), size: Size3(width: 5.0, height: 5.0))

extension Rect3 {
	init(center: Point3, size: Size3) {
		
		let originX = center.x - (size.width / 2)
		let originY = center.y - (size.height / 2)
		self.init(origin: Point3(x: originX, y: originY), size: size)
	}
}

let centerRect2 = Rect3(center: Point3(x: 4.0, y: 4.0), size: Size3(width: 3.0, height: 3.0))

//:## 3. Methods
let lnX3 = #line
extension Int {
	
	func repetitions(task: () -> Void) {
		for _ in 0..<self {
			task()
		}
	}
}

3.repetitions {
	print("Hello")
}

//:## 4. Mutating Instance Methods
let lnX4 = #line
extension Int {
	
	mutating func square() {
		self = self * self
	}
}

var someInt = 3
someInt.square()

//:## 5. Substcripts
let lnX5 = #line
extension Int {
	subscript (digitIndex: Int) -> Int {
		var decimalBase = 1
		for _ in 0..<digitIndex {
			decimalBase *= 10
		}
		
		return (self/decimalBase) % 10
	}
}

746381295[0]
746381295[1]
746381295[2]
746381295[3]
746381295[4]
746381295[5]
746381295[6]
746381295[7]
746381295[8]

//:## 6. Nested Types
let lnX6 = #line
extension Int {
	
	enum Kind {
		case negative, zero, positive
	}
	
	var kind: Kind {
		switch self {
		case 0:
			return .zero
		case let x where x > 0:
			return .positive
		default:
			return .negative
		}
	}
}

func printIntegerKinds(_ numbers: [Int]) {
	for number in numbers {
		switch number.kind {
		case .negative:
			print("- ", terminator: "")
		case .zero:
			print("0 ", terminator: "")
		case .positive:
			print("+ ", terminator: "")
			
		}
	}
	print("")
}

printIntegerKinds([3, 19, -27, -6, 0, 7])

//:# XI. Generics

//:## 1. The problem that generics solve
let lnXI1 = #line
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
	let temporaryA = a
	a = b
	b = temporaryA
}

var someInt2 = 3
var anotherInt = 107

swap(&someInt2, &anotherInt)
print("someInt is now \(someInt2) and anotherInt is now \(anotherInt)")

//:## 2. Type parameters
let lnXI2 = #line
func swapTwoValues <T>(_ a: inout T, _ b: inout T) {
	let temporaryA = a
	a = b
	b = temporaryA
}

var someString = "hello"
var anotherString = "world"

swap(&someString, &anotherString)

//:## 3. Generic Types
let lnXI3 = #line
struct Stack <Element> {
	var items = [Element]()
	mutating func push(_ item: Element) {
		items.append(item)
	}
	
	mutating func pop() -> Element {
		return items.removeLast()
	}
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

//:## 4. Extending a generic type
let lnXI4 = #line
extension Stack {
	var topItem: Element? {
		return items.isEmpty ? nil : items[items.count - 1]
	}
}

if let topItem = stackOfStrings.topItem {
	print("The top item on the stack is \(topItem)")
}

//:## 5. Type Constraints
let lnXI5 = #line
func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
	for (index, value) in array.enumerated() {
		if value == valueToFind {
			return index
		}
	}
	return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])

//:## 6. Associated Types
let lnXI6 = #line
protocol Container {
	associatedtype ItemType
	mutating func append(_ item: ItemType)
	var count: Int { get }
	subscript (i: Int) -> ItemType { get }
}

struct IntStack2: Container {
	//original implementation
	var items = [Int]()
	mutating func push(_ item: Int) {
		items.append(item)
	}
	mutating func pop() -> Int {
	return items.removeLast()
	}
	// conformance to the Container protocol
	typealias ItemType = Int
	mutating func append(_ item: Int) {
		self.push(item)
	}
	var count: Int {
		return items.count
	}
	subscript (i: Int) -> Int {
		return items[i]
	}
}

struct Stack2<Element>: Container {
	//original implementation
	var items = [Element]()
	mutating func push(_ item: Element) {
		items.append(item)
	}
	mutating func pop() -> Element {
		return items.removeLast()
	}
	// conformance to the Container protocol
	mutating func append(_ item: Element) {
		self.push(item)
	}
	var count: Int {
		return items.count
	}
	subscript (i: Int) -> Element {
		return items[i]
	}
}

// 7. Extending an Existing Type to Specify an Assicated Type
let lnXI7 = #line
extension Array: Container {}

//:## 8. Where Clauses
let lnXI8 = #line
func allItemsMatch<C1, C2>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1: Container, C2: Container, C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
	// check that both containers contain the same number of items
	if someContainer.count != anotherContainer.count {
		return false
	}
	
	for i in 0..<someContainer.count {
		if someContainer[i] != anotherContainer[i] {
			return false
		}
	}
	
	return true
}

var stackOfStrings2 = Stack2<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(stackOfStrings2, arrayOfStrings) {
	print("All items match")
}
else {
	print("Not all items match")
}

enum TopLevel {
	case enums (EnumsSection)
	case structs (StructsSection)
	case classes (ClassesSection)
	case arc (AutomaticReferenceCounting)
	case optionalChaining (OptionalChaining)
	case protocols (ProtocolsSection)
	case errors (ErrorsSection)
	case typeCasting (TypeCastingSection)
	case nestedTypes
	case extensions (ExtentionsSection)
	case generics (GenericsSection)
}

enum EnumsSection {
	case declaration
	case associatedValueExtraction
	case rawValue
	case initializingFromRawValue
	case recursiveEnumerations
	case failableInitializers
	case failableinitializersWithRawValues
}

enum StructsSection {
	case declaration
	case initialization
	case customizingInitializing
	case memberwiseInitializer
	case initializerDelegation
	case failableInitializer
	case storedProperties
	case computedProperties
	case readOnlyComputedProperties
	case typeProperties
}

enum ClassesSection {
	case initialization
	case classesAsReferenceTypes
	case lazyProperties
	case propertyObservers
	case typeProperties
	case inheritance
	case overriding
	case preventingOverrides
	case initializationAndInheritance
	case propagationOfInitializerFailure
	case overridingFailableInitializer
	case requiredInitializers
	case defaultPropertyWithClosure
	case deinitializing
}

enum AutomaticReferenceCounting {
	case retainCyclesBetweenInstance
	case unownedReferences
	case retainCyclesForClosures
}

enum OptionalChaining {
	case presentation
	case accessingProperties
	case callingMethods
	case accessingSubscripts
	case accessingOptionalSubscripts
	case linkingMultipleLevelsOfChaining
	case chainingOnMethodsWithOptionalReturnValues
}

enum ProtocolsSection {
	case declaration
	case methodRequirements
	case mutatingMethodRequirements
	case protocolsAsType
	case delegation
	case extensionsForProtocolConformance
	case collectionsOfProtocolTypes
	case protocolInheritance
	case classOnlyProtocols
	case protocolComposition
	case checkingForProtocolConformance
	case optionalProtocolRequirements
	case protocolExtensions
}

enum ErrorsSection {
	case presentation
	case convertingErrorToOptionals
	case initializersAsThrowingFunctions
	case assertions
}

enum TypeCastingSection {
	case checkingType
	case downcasting
	case usingAnyAndAnyobject
}

enum ExtentionsSection {
	case computedProperties
	case initializers
	case methods
	case mutatingInstanceMethods
	case subscripts
	case nestedTypes
}

enum GenericsSection {
	case presentation
	case typeParamaters
	case genericTypes
	case extendingAGenericType
	case typeConstraints
	case associatedTypes
	case extensionsWithAssociatedTypes
	case whereClauses
}

func tableOfContent(with input: TopLevel) -> Int {
	switch input {
	case .enums (let enums):
		switch enums {
		case .declaration:
			return lnI1
		case .associatedValueExtraction:
			return lnI2
		case .rawValue:
			return lnI3
		case .initializingFromRawValue:
			return lnI4
		case .recursiveEnumerations:
			return lnI5
		case .failableInitializers:
			return lnI6
		case .failableinitializersWithRawValues:
			return lnI7
		}
	case .structs (let structs):
		switch structs {
		case .declaration:
			return lnII1
		case .initialization:
			return lnII2
		case .customizingInitializing:
			return lnII3
		case .memberwiseInitializer:
			return lnII4
		case .initializerDelegation:
			return lnII5
		case .failableInitializer:
			return lnII6
		case .storedProperties:
			return lnII7
		case .computedProperties:
			return lnII8
		case .readOnlyComputedProperties:
			return lnII9
		case .typeProperties:
			return lnII10
		}
	case .classes (let classes):
		switch classes {
		case .initialization:
			return lnIII1
		case .classesAsReferenceTypes:
			return lnIII2
		case .lazyProperties:
			return lnIII3
		case .propertyObservers:
			return lnIII4
		case .typeProperties:
			return lnIII5
		case .inheritance:
			return lnIII6
		case .overriding:
			return lnIII7
		case .preventingOverrides:
			return lnIII8
		case .initializationAndInheritance:
			return lnIII9
		case .propagationOfInitializerFailure:
			return lnIII10
		case .overridingFailableInitializer:
			return lnIII11
		case .requiredInitializers:
			return lnIII12
		case .defaultPropertyWithClosure:
			return lnIII13
		case .deinitializing:
			return lnIII14
		}
	case .arc (let arc):
		switch arc {
		case .retainCyclesBetweenInstance:
			return lnIV1
		case .unownedReferences:
			return lnIV2
		case .retainCyclesForClosures:
			return lnIV3
		}
	case .optionalChaining (let optionalChaining):
		switch optionalChaining {
		case .presentation:
			return lnV1
		case .accessingProperties:
			return lnV2
		case .callingMethods:
			return lnV3
		case .accessingSubscripts:
			return lnV4
		case .accessingOptionalSubscripts:
			return lnV5
		case .linkingMultipleLevelsOfChaining:
			return lnV6
		case .chainingOnMethodsWithOptionalReturnValues:
			return lnV7
		}
	case .protocols (let protocols):
		switch protocols {
		case .declaration:
			return lnVI1
		case .methodRequirements:
			return lnVI2
		case .mutatingMethodRequirements:
			return lnVI3
		case .protocolsAsType:
			return lnVI4
		case .delegation:
			return lnVI5
		case .extensionsForProtocolConformance:
			return lnVI6
		case .collectionsOfProtocolTypes:
			return lnVI7
		case .protocolInheritance:
			return lnVI8
		case .classOnlyProtocols:
			return lnVI9
		case .protocolComposition:
			return lnVI10
		case .checkingForProtocolConformance:
			return lnVI11
		case .optionalProtocolRequirements:
			return lnVI12
		case .protocolExtensions:
			return lnVI13
		}
	case .errors (let errors):
		switch errors {
		case .presentation:
			return lnVII1
		case .convertingErrorToOptionals:
			return lnVII2
		case .initializersAsThrowingFunctions:
			return lnVII3
		case .assertions:
			return lnVII4
		}
	case .typeCasting (let typeCasting):
		switch typeCasting {
		case .checkingType:
			return lnVIII1
		case .downcasting:
			return lnVIII2
		case .usingAnyAndAnyobject:
			return lnVIII3
		}
	case .nestedTypes:
		return lnIX
	case .extensions (let extensions):
		switch extensions {
		case .computedProperties:
			return lnX1
		case .initializers:
			return lnX2
		case .methods:
			return lnX3
		case .mutatingInstanceMethods:
			return lnX4
		case .subscripts:
			return lnX5
		case .nestedTypes:
			return lnX6
		}
	case .generics (let generics):
		switch generics {
		case .presentation:
			return lnXI1
		case .typeParamaters:
			return lnXI2
		case .genericTypes:
			return lnXI3
		case .extendingAGenericType:
			return lnXI4
		case .typeConstraints:
			return lnXI5
		case .associatedTypes:
			return lnXI6
		case .extensionsWithAssociatedTypes:
			return lnXI7
		case .whereClauses:
			return lnXI8
		}
	}
}

//TABLE OF CONTENT

//I. ENUMS
//	1. Declaration
	tableOfContent(with: .enums(.declaration))
//	2. Associated values extraction
	tableOfContent(with: .enums(.associatedValueExtraction))
//	3. Raw values
	tableOfContent(with: .enums(.rawValue))
//	4. Initializing from a raw value
	tableOfContent(with: .enums(.initializingFromRawValue))
//	5. Recursive Enumerations
	tableOfContent(with: .enums(.recursiveEnumerations))
//	6. Failable initializers
	tableOfContent(with: .enums(.failableInitializers))
//	7. Failable initializers with raw values
	tableOfContent(with: .enums(.failableinitializersWithRawValues))
//II. STRUCTS
//	1. Declaration
	tableOfContent(with: .structs(.declaration))
//	2. Initialization
	tableOfContent(with: .structs(.initialization))
//	3. Customizing Initialization
	tableOfContent(with: .structs(.customizingInitializing))
//	4. Memberwise Initializers
	tableOfContent(with: .structs(.memberwiseInitializer))
//	5. Initializer delegation
	tableOfContent(with: .structs(.initializerDelegation))
//	6. Failable initializers
	tableOfContent(with: .structs(.failableInitializer))
//	7. Stored properties
	tableOfContent(with: .structs(.storedProperties))
//	8. Computed properties
	tableOfContent(with: .structs(.computedProperties))
//	9. Read-Only Computed Properties
	tableOfContent(with: .structs(.readOnlyComputedProperties))
//	10. Type properties
	tableOfContent(with: .structs(.typeProperties))
//III. CLASSES
//	1. Initialization
	tableOfContent(with: .classes(.initialization))
//	2. Classes as reference types and the identity operator
	tableOfContent(with: .classes(.initialization))
//	3. Lazy stored properties
	tableOfContent(with: .classes(.lazyProperties))
//	4. Property observers
	tableOfContent(with: .classes(.propertyObservers))
//	5. Type properties
	tableOfContent(with: .classes(.typeProperties))
//	6. Inheritance
	tableOfContent(with: .classes(.inheritance))
//	7. Overriding
	tableOfContent(with: .classes(.overriding))
//	8. Preventing overrides
	tableOfContent(with: .classes(.preventingOverrides))
// 	9. Initialization and inheritance
	tableOfContent(with: .classes(.initializationAndInheritance))
//	10. Propagation of initializer failure
	tableOfContent(with: .classes(.propagationOfInitializerFailure))
//	11. Overriding a Failable Initializer
	tableOfContent(with: .classes(.overridingFailableInitializer))
//	12. Required Initializers
	tableOfContent(with: .classes(.requiredInitializers))
//	13. Setting a default property with a closure or a function
	tableOfContent(with: .classes(.defaultPropertyWithClosure))
//	14. Deinitialization
	tableOfContent(with: .classes(.deinitializing))
//IV. AUTOMATIC REFERENCE COUNTING
//	1. Strong reference Cycles between class instances
	tableOfContent(with: .arc(.retainCyclesBetweenInstance))
//	2. Unowned references and implicitly unwrapped optional properties
	tableOfContent(with: .arc(.unownedReferences))
// 	3. Strong reference cycles for closures
	tableOfContent(with: .arc(.retainCyclesForClosures))
//V. OPTIONAL CHAINING
//	1. Presentation
	tableOfContent(with: .optionalChaining(.presentation))
//	2. Accessing Properties
	tableOfContent(with: .optionalChaining(.accessingProperties))
//	3. Calling methods
	tableOfContent(with: .optionalChaining(.callingMethods))
//	4. Accessing subscripts
	tableOfContent(with: .optionalChaining(.accessingSubscripts))
//	5. Accessing subscripts of optional types
	tableOfContent(with: .optionalChaining(.accessingOptionalSubscripts))
//	6. Linking multiple levels of chaining
	tableOfContent(with: .optionalChaining(.linkingMultipleLevelsOfChaining))
//	7. Chaining on methods with optional return values
	tableOfContent(with: .optionalChaining(.chainingOnMethodsWithOptionalReturnValues))
//VI. PROTOCOLS
//	1. Declaration
	tableOfContent(with: .protocols(.declaration))
//	2. Method requirements
	tableOfContent(with: .protocols(.methodRequirements))
//	3. Mutating method requirements
	tableOfContent(with: .protocols(.mutatingMethodRequirements))
//	4. Protocols as Types
	tableOfContent(with: .protocols(.protocolsAsType))
//	5. Delegation
	tableOfContent(with: .protocols(.delegation))
//	6. Adding protocol conformance with an extension
	tableOfContent(with: .protocols(.extensionsForProtocolConformance))
//	7. Collections of protocol types
	tableOfContent(with: .protocols(.collectionsOfProtocolTypes))
//	8. Protocol Inheritance
	tableOfContent(with: .protocols(.protocolInheritance))
//	9. Class-only Protocols
	tableOfContent(with: .protocols(.classOnlyProtocols))
//	10. Protocol Composition
	tableOfContent(with: .protocols(.protocolComposition))
//	11. Checking for Protocol Conformance
	tableOfContent(with: .protocols(.checkingForProtocolConformance))
//	12. Optional Protocol Requirements
	tableOfContent(with: .protocols(.optionalProtocolRequirements))
//	13. Protocol Extensions
	tableOfContent(with: .protocols(.protocolExtensions))
//VII. ERRORS
//	1. Presentation
	tableOfContent(with: .errors(.presentation))
//	2. Converting errors to optional values
	tableOfContent(with: .errors(.convertingErrorToOptionals))
//	3. Initializers as throwing functions
	tableOfContent(with: .errors(.initializersAsThrowingFunctions))
//	4. Assertions
	tableOfContent(with: .errors(.assertions))
//VIII. TYPE CASTING
//	1. Checking type
	tableOfContent(with: .typeCasting(.checkingType))
//	2. Downcasting
	tableOfContent(with: .typeCasting(.downcasting))
//	3. Using Any and AnyObject
	tableOfContent(with: .typeCasting(.usingAnyAndAnyobject))
//IX. NESTED TYPES
//X. EXTENSIONS
//	1. Computed Properties
	tableOfContent(with: .extensions(.computedProperties))
//	2. Initializers
	tableOfContent(with: .extensions(.initializers))
//	3. Methods
	tableOfContent(with: .extensions(.methods))
//	4. Mutating Instance Methods
	tableOfContent(with: .extensions(.mutatingInstanceMethods))
//	5. Substcripts
	tableOfContent(with: .extensions(.subscripts))
//	6. Nested Types
	tableOfContent(with: .extensions(.nestedTypes))
//XI. GENERICS
//	1. The problem that generics solve
	tableOfContent(with: .generics(.presentation))
//	2. Type parameters
	tableOfContent(with: .generics(.typeParamaters))
//	3. Generic Types
	tableOfContent(with: .generics(.genericTypes))
//	4. Extending a generic type
	tableOfContent(with: .generics(.extendingAGenericType))
//	5. Type Constraints
	tableOfContent(with: .generics(.typeConstraints))
//	6. Associated Types
	tableOfContent(with: .generics(.associatedTypes))
//	7. Extending an Existing Type to Specify an Associated Type
	tableOfContent(with: .generics(.extensionsWithAssociatedTypes))
// 	8. Where Clauses
	tableOfContent(with: .generics(.whereClauses))
