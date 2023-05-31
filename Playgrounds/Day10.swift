/*
    Day 10 - Structs PT.1 - create our own data types out of a bunch of different small types
 */

// similar to Objects in java, create the object with the given attributes
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

Album(title: "1989", artist: "Taylor Swift", year: 2011)
//
let tSwift = Album.init(title: "1989", artist: "Taylor Swift", year: 2011)
print(tSwift)
tSwift.printSummary()


//if structs instance is CONSTANT than data inside is immutable
// change the func to a MUTATING FUNCTION
struct Employee {
    //properties
    var name: String
    var vacationRemaining = 35
    var position: String
    
    //methods
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        }
        else{
            print("Oops! There aren't enough days remaining")
        }
    }
    func printSummary(){
        print("Employee(\(position)): \(name), has \(vacationRemaining) vacation days remaining")
    }

    mutating func fireEmployee() -> Employee {
        let position = position.self
        name = "no employee"
        vacationRemaining = 35
        return Employee(name: name, position: position)
    }

}

var dataAnalyst = Employee.init(name: "Justin Trubela", position: "Data Analyst")
var manager = Employee.init(name: "Monica Applebottom", position: "Manager")
var leadProgrammer = Employee.init(name: "James Olatunji", position: "Lead Programmer")

dataAnalyst.takeVacation(days: 1)
dataAnalyst.printSummary()

manager.takeVacation(days: 7)
manager.printSummary()

leadProgrammer.printSummary()
leadProgrammer.fireEmployee()
leadProgrammer.printSummary()

manager.printSummary()
manager.fireEmployee()
manager.printSummary()


//Difference between a struct and a tuple
    // tuple is a struct without a name
    // updating information with a tuple can be quite tedious

//Difference between a function and a method
    //functions alone do not belong anywhere
    //functions inside structs(methods) belong to that object and that object alone unless inherited by a child

struct Delorean {
    var speed = 0
    mutating func accelerate() {
        speed += 1
        if speed == 88 {
            travelThroughTime()
        }
    }
    func travelThroughTime() {
        print("Where we're going we don't need roads.")
    }
}


//How to compute property values dynamically
//stored property is a variable or constant that holds a piece of data inside an instance of the struct
//computed property calculates the value of the property dynamically everytime

struct EmployeeComputed {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        //get the value for this calculation and set it with a new value
        get{ vacationAllocated - vacationTaken }
        set{ vacationAllocated = vacationTaken + newValue }
    }
}

var Justin = EmployeeComputed(name: "Justin Trubela", vacationAllocated: 14)
Justin.vacationTaken += 4
print(Justin.vacationAllocated)
Justin.vacationRemaining = 5
print(Justin.vacationAllocated)

struct Code {
    var language: String
    var containsErrors = false
    var report: String {
        if containsErrors {
            return "This \(language) code has bugs!"
        } else {
            return "This looks good to me."
        }
    }
}

//willSet and didSet

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

//Custom initializers

struct Player {
    var name: String
    var number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Justin T")
print(player.number)


// how do memberwise initializers work
struct HREmployee {
    var name: String
    var yearsActive = 0
}

//
extension HREmployee {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let roslin = HREmployee(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = HREmployee()

