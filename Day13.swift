/*
 DAY 13 - PROTOCOLS
 */

protocol Vehicle {
    var name: String {get}
    var currentPassengers: Int {get set}
    func estimateTime(for distance: Int) -> Int     // NO FUNCTION BODIES ALLOWED
    func travel(distance: Int)
}

protocol CanBeElectric {
    //some code
}

// ALL FUNCTIONS INSIDE THE STRUCTURE MUST INCLUDE ONES THAT WERE INITIALIZED DURING THE PROTOCOL
struct Car: Vehicle, CanBeElectric {        //SHOWS YOU CAN CONORM TO MULTIPLE PROTOCOLS
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance/50
    }
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    func openSunRoof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bike"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance/10
    }
    func travel(distance: Int) {
        print("I'm cycling \(distance)km")
    }
}

func commute(distance: Int, using vehicle: Vehicle){
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's to slow! I'll try a different vehicle")
    }
    else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int){
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)")
    }
}

let car = Car()
commute(distance: 100, using: car)
let bicycle = Bicycle()
commute(distance: 100, using: bicycle)
getTravelEstimates(using: [car, bicycle], distance: 150)



struct book {
    var name: String
}

func purchase(_ book: book){
    print("Im buying: \(book)")
}

var NightTrainToLisbon = book(name: "Night Train To Lisbon")
purchase(NightTrainToLisbon)



protocol Purchaseable {
    var name: String {get set}
}

struct Book: Purchaseable {
    var name: String
    var author: String
    var publisher: String
}

struct Movie: Purchaseable {
    var name: String
    var producer: String
    var actors: String
}

struct Motorcycle: Purchaseable {
    var name: String
    var manufacturer: String
    var numberOfPassengers: Int
}

var nightTrainToLisbon = Book(name: "Night Train To Lisbon", author: "", publisher: "")

func buy(_ item: Purchaseable){
    print("I'm buying \(item)")
}

buy(Book(name: "Night Train To Lisbon", author: "Amedeu De Prado", publisher: "cedar vehlmo"))



// OPAQUE RETURN TYPES

protocol View { }

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}
func getRandomBool() -> some Equatable {
    Bool.random()
}
print(getRandomNumber() == getRandomNumber())
print(getRandomBool() == getRandomBool())


//PRACTICLE USE OF OPAQUE RETURN TYPES
// -> some view
// -> some layout
// -> some UIView
// -> some scrollPane
// -> some ...


// HOW TO CREATE AND USE EXTENSIONS
// Extensions make long wordy methods smaller
// string has white space and we want to remove it
var quote = "   The truth is rarely pure and never simple   "
// trimmingCharacters(in: .whitespacesAndNewlines)
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

//==creating the extension

extension String {
    func trimmed() {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

let trimmed01: () = quote.trimmed()
let trimmed2 = trim(quote)

let lyrics = """
But I keep cruising
can't stop, wont stop moving
it's like I got this music in my mind
staying it's gonna be alright
"""
print(lyrics.lines.count)

lyrics.components(separatedBy: .newlines)


struct Book1 {
    let title: String
    let pageCount: Int
    let readingHours: Int
    
//    init(title: String, pageCount: Int){
//        self.title = title
//        self.pageCount = pageCount                creating this disables all memberwise initializers made in previous code
//        self.readingHours = pageCount/50
//    }
}

//thats why we use extensions to keep things organized and efficient
extension Book1{
    
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount/50
    }
}
let lotr = Book1(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

// When should you use extensions in swift
// it lets us add functionality to classes, structs, and more, which is helpful for modifyling types we dont own


extension String {
    mutating func append(_ other: String){
        self += other
    }
}

var string1 = "I'm a string"
var string2 = "waiting to meet my other half"
var myString: () = string1.append(string2)
print(myString)

extension Int {
    var isAnswerToLifeUniverseAndEverything: Bool {
        let target = 42
        return self == target
    }
}


//How to create and use protocol extensions

let guests = ["mario", "luigi", "peach"]

//  TO CHECK IF ITS NOT EMPTY !guests.isEmpty is propper but messy  //
/**********************************************************************************************************/
/***/           extension /*Array*/ Collection {                   /***/    //isEmpty can be used on all collection types
/***/                   var isNotEmpty: Bool {                     /***/
/***/                       return isEmpty == false                /***/
/***/                   }                                          /***/
/***/                }                                             /***/
/***/                                                              /***/
/***/                if !guests.isEmpty{                           /***/
/***/                    print("Guest count: \(guests.count)")     /***/
/***/                }                                             /***/
/**********************************************************************************************************/

// MAKES THIS MUCH MORE READABLE
if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

let numbers = [4, 8, 12, 16]
let allEven = numbers.allSatisfy { $0.isMultiple(of: 2) }

let numbers2 = Set([4, 8, 15, 16])
let allEven2 = numbers2.allSatisfy { $0.isMultiple(of: 2) }

let numbers3 = ["four": 4, "eight": 8, "fifteen": 15, "sixteen": 16]
let allEven3 = numbers3.allSatisfy { $0.value.isMultiple(of: 2) }

//protocol Fencer: Int {
//
//}

protocol Fencer {
    func fenceFoil()
}
extension Fencer {
    func fenceFoil() {
        print("En garde")
    }
}

