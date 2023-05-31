
/*
 DAY 14 - Nil Coalescing
 */

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty")
}

var num1: Int = 1
var num2: Int = 2
var num3: Int? = nil

var str1 = "hello"
var str2 = ""
var str3: String? = nil

func square (number: Int) -> Int {
    number * number
}

var number: Int? = nil

if let number = number {
    print(square(number: number))
}

func findGreatestValueInList(list: [Int])->Int? {
    if list.count == 0 {
        return nil
    }
    
    var greatestValue = -1
    for number in list {
        if number > greatestValue {
            greatestValue = number
        }
    }
    return greatestValue
}

[1,2,3].max()

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    print("\(number) * \(number) is \(number * number)")
}

printSquare(of: number)

func playOpera(by composer: String?) -> String? {
    guard let composer = composer else{
        return "Please specify a composer."
    }
    if composer == "Mozart" {
        return "Le nozze di Figaro"
    } else {
        return nil
    }
}
if let opera = playOpera(by: "Mozart") {
    print(opera)
}

func uppercase(string: String?) -> String? {
    guard let string = string else {
        return nil
    }
    return string.uppercased()
}
if let result = uppercase(string: "Hello") {
    print(result)
}

//func add3(to number: Int) -> Int {
//    guard let number = number else {
//        return 3
//    }
//    return number + 3
//}
//let added = add3(to: 5)
//print(added)

//func username(for id: Int?) -> String {
//    guard let id = id else {
//        return nil
//    }
//    if id == 1989 {
//        return "Taylor Swift"
//    } else {
//        return nil
//    }
//}

func plantTree(_ type: String?) {
    guard let type = type else {
        return
    }
    print("Planting a \(type).")
}
plantTree("willow")


let captains = [
    "Enterprise": "Picard",
    "Voyager" : "Janeway",
    "Defiant": "Sisko"
]

let nemesis = [ "Mario": "Wario",
                "Spiderman": "Green Goblin",
                "Batman": "Penguin",
]

let new = captains["Serenity"] ?? "N/A"

//let new = captains["Serenity", default: "N/A"]        Dictionary Default

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite  = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}


let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"

let input = ""
let number5 = Int(input) ?? 0
print(number5)



// chaining optionals  -  if the optional has a value inside, unwrap it then...

let names = ["arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Bookk {
    let title: String
    let author: String?
}

//var bookk = Bookk? = nil
//let author = bookk?.author.first?.uppercased() ?? "A"

let namess = ["Vincent": "van Gogh", "Pablo": "Picasso", "Claude": "Monet"]
let surnameLetter = namess["Vincent"]?.first?.uppercased()


let credentials = ["twostraws", "fr0sties"]
let lowercaseUsername = credentials.first?.lowercased()

func albumReleased(in year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    case 2017: return "Reputation"
    default: return nil
    }
}
let album = albumReleased(in: 2006)?.uppercased()

let attendees: [String]? = [String]()
let firstInLine = attendees?.first?.uppercased()

let racers = ["Hamilton", "Verstappen", "Vettel"]
let winnerWasVE = racers.first?.hasPrefix("Ve")

//How to handle function failure with optionals

enum UserError: Error{
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}
if let user = try? getUser(id: 23) {
    print("user: \(user)")
}

let user = ( try? getUser(id: 23)) ?? "Anonymous"


// Summary
//Let’s recap what we learned:
//
//Optionals let us represent the absence of data, which means we’re able to say “this integer has no value” – that’s different from a fixed number such as 0.
//As a result, everything that isn’t optional definitely has a value inside, even if that’s just an empty string.
//Unwrapping an optional is the process of looking inside a box to see what it contains: if there’s a value inside it’s sent back for use, otherwise there will be nil inside.
//We can use if let to run some code if the optional has a value, or guard let to run some code if the optional doesn’t have a value – but with guard we must always exit the function afterwards.
//The nil coalescing operator, ??, unwraps and returns an optional’s value, or uses a default value instead.
//Optional chaining lets us read an optional inside another optional with a convenient syntax.
//If a function might throw errors, you can convert it into an optional using try? – you’ll either get back the function’s return value, or nil if an error is thrown.


/*
 Now that you understand a little about optionals, it’s time to pause for a few minutes and try a small coding challenge so you can see how much you’ve remembered.

 If that sounds easy, it’s because I haven’t explained the catch yet: I want you to write your function in a single line of code. No, that doesn’t mean you should just write lots of code then remove all the line breaks – you should be able to write this whole thing in one line of code.
 
 Still here? Okay, here are some hints:

 Your function should accept an [Int]? – an array of integers that might be there, or might be nil.
 It needs to return a non-optional Int.
 You can use optional chaining to call randomElement() on the optional array, which will in turn return another optional.
 Because you need to return a non-optional integer, you should use nil coalescing to pick a random number from 1 through 100.
 */



//
//Your challenge is this: write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.

func arrayRandomizer(_ num:[Int]?) -> Int? {
    if let num = num {
        return num.randomElement()
    }
    return Int.random(in: 1...100)
}
let array = [Int]()
print(arrayRandomizer(array) ?? 69)
