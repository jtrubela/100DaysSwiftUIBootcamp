/*
 Day 11 - Structures PT.2 - Private, public, static - how to limit acces to internal data using access control
 */

    // private - Don't let anything outside the struct use this data
    // fileprivate - Don't let anything outside the current file use this data
    // public - Let anyone, anywhere use this data

    // private(set) - let anyone read this property but only let me internal methods write to it

//Whats the point of access control?
    //they place restrictions about what you can and can't do, and you need to abide by those restrictions
    // by using private im asking swift to enforce the rules for me: dont let me read or write this porperty from anywhere outside the struct
    // lets us control how other people see our code

struct bankAccount {
    private(set) var funds: Double = 0
    
    mutating func deposit(_ amount: Double) {
        funds += amount
        print("Your balance is \(funds)")
    }
    mutating func withdraw(_ amount: Double) {
        if funds >= amount{
            funds -= amount
        }
        else {
            print("not enough funds")
        }
        print("Your balance is \(funds)")
    }
    func getBalance() {
        print(funds)
    }
}


var account = bankAccount(funds: 1000.0)
// account.funds += 1000 -- private(set) makes this inaccessible

account.deposit(1000.0)
account.withdraw(2000.0)
account.getBalance()


// Static properties and methods
struct School {
    static var studentCount = 0
    
    static func add(student: String){
        print("\(student) joined the school")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

struct NewsStory {
    static var breakingNewsCount = 0
    static var regularNewsCount = 0
    var headline: String
    init(headline: String, isBreaking: Bool) {
        self.headline = headline
        if isBreaking {
            NewsStory.breakingNewsCount += 1
        } else {
            NewsStory.regularNewsCount += 1
        }
    }
}


struct Person {
    static var population = 0
    var name: String
    init(personName: String) {
        name = personName
        Person.population += 1
    }
}

Person.init(personName: "Justin")
Person.population

struct FootballTeam {
    static let teamSize = 11
    var players: [String]
}

struct Pokemon {
    static var numberCaught = 0
    var name: String
    static func catchPokemon() {
        print("Caught!")
        Pokemon.numberCaught += 1
    }
}

struct Order {
    static let orderFormat = "XXX-XXXX"
    var orderNumber: String
}


// SUMMARY
/*You can create your own structs by writing struct, giving it a name, then placing the struct’s code inside braces.
Structs can have variable and constants (known as properties) and functions (known as methods)
If a method tries to modify properties of its struct, you must mark it as mutating.
You can store properties in memory, or create computed properties that calculate a value every time they are accessed.
We can attach didSet and willSet property observers to properties inside a struct, which is helpful when we need to be sure that some code is always executed when the property changes.
Initializers are a bit like specialized functions, and Swift generates one for all structs using their property names.
You can create your own custom initializers if you want, but you must always make sure all properties in your struct have a value by the time the initializer finishes, and before you call any other methods.
We can use access to mark any properties and methods as being available or unavailable externally, as needed.
It’s possible to attach a property or methods directly to a struct, so you can use them without creating an instance of the struct.*/


/* Check point 6*/
/*create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?  */

struct Car {
    private let model: String
    private let numSeats: Int
    let maxGears: Int
    
    private static var gear = 1
    
    init(model: String, numSeats: Int, maxGears: Int) {
        self.model = model
        self.numSeats = numSeats
        self.maxGears = maxGears
    }
    
    mutating func increaseGear(){
        if Car.gear < self.maxGears {
            Car.gear += 1
            print("Gear increased")
        }
        else{
            print("*sound of grinding gears* ~ Can't increase gear")
        }
    }
    mutating func decreaseGear(){
        if Car.gear > 1 {
            Car.gear -= 1
            print("Gear decreased")
        }
        else{
            print("*sound of grinding gears* ~ Can't derease gear")
        }
    }
    func getGear(){
        print("\(self.model) is riding smooth in gear \(Car.gear)")
    }
}

var ferrari = Car(model: "Ferrari", numSeats: 2, maxGears: 10)

for _ in 1...ferrari.maxGears {
ferrari.increaseGear()
}
for _ in 1...ferrari.maxGears {
ferrari.decreaseGear()
}
ferrari.getGear()
