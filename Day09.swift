import UIKit

/*
 DAY 9: CLOSURES
 */


func greetUser() {
    print("Hi there!")
}

//How to create and use closures
let sayHello = { (name: String) -> String in
    "Hi there\(name)!"
}

sayHello("Justin")

greetUser()
var greetCopy:() -> Void = greetUser
//var greetCopyFunctionValue = greetCopy()

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    }
    else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)



let team = ["Gloria","Suzanne","Piper","Tiffany","Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

//We want suzanne to come first since she is the captain

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne"{
        return true
    }
    else if name2 == "Suzanne"{
        return false
    }
        return name1 < name2
}

//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)


// were condensing both the function call and the sort call into one closure

let captainFirstTeam =  team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne"{
        return true
    }
    else if name2 == "Suzanne"{
        return false
    }
        return name1 < name2
})
print(captainFirstTeam)

let greetUser1 = {
    print("Hi there!")
}
print(greetUser1)

var pickFruit = { (name: String) in
    switch name {
    case "strawberry":
        fallthrough
    case "raspberry":
        print("Strawberries and raspberries are half price!")
    default:
        print("We don't have those.")
    }
}

pickFruit("strawberry")

var cutGrass = { (currentLength: Double) in
    switch currentLength {
    case 0.0...1.0:
        print("That's too short")
    case 1...3:
        print("It's already the right length")
    default:
        print("That's perfect.")
    }
}
cutGrass(0.5)


// How to use trailing colosures and shorthand syntax
//reducing amount of syntax that comes with closures

let reverseTeam = team.sorted { $0 > $1}
print(reverseTeam)


//How tto accept functions as paramaters
//thanks to trailing closure syntax

func makeArray(size:Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(rolls)


func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done")
}

doImportantWork {
    print("this is first work")
}
second:{
        print("this is second work")
}
third: {
    print("this is third work")
}

let awesomeTalk = {
    print("Here's a great talk!")
}
func deliverTalk(name: String, type: () -> Void) {
    print("My talk is called \(name)")
    type()
}
deliverTalk(name: "My Awesome Talk", type: awesomeTalk)


func goOnVacation(to destination: String, _ activities: () -> Void) {
    print("Packing bags...")
    print("Getting on plane to \(destination)...")
    activities()
    print("Time to go home!")
}
goOnVacation(to: "Mexico") {
    print("Go sightseeing")
    print("Relax in sun")
    print("Go hiking")
}

///*
// You can copy functions in Swift, and they work the same as the original except they lose their external parameter names.
// All functions have types, just like other data types. This includes the parameters they receive along with their return type, which might be Void – also known as “nothing”.
// You can create closures directly by assigning to a constant or variable.
// Closures that accept parameters or return a value must declare this inside their braces, followed by the keyword in.
// Functions are able to accept other functions as parameters. They must declare up front exactly what data those functions must use, and Swift will ensure the rules are followed.
// In this situation, instead of passing a dedicated function you can also pass a closure – you can make one directly. Swift allows both approaches to work.
// When passing a closure as a function parameter, you don’t need to explicitly write out the types inside your closure if Swift can figure it out automatically. The same is true for the return value – if Swift can figure it out, you don’t need to specify it.
// If one or more of a function’s final parameters are functions, you can use trailing closure syntax.
// You can also use shorthand parameter names such as $0 and $1, but I would recommend doing that only under some conditions.
// You can make your own functions that accept functions as parameters, although in practice it’s much more important to know how to use them than how to create them.
// */


/*
 CHECKPOINT 5
 
 With closures under your belt, it’s time to try a little coding challenge using them.

 You’ve already met sorted(), filter(), map(), so I’d like you to put them together in a chain – call one, then the other, then the other back to back without using temporary variables.

 Your input is this:

 let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
 Your job is to:

 Filter out any numbers that are even
 Sort the array in ascending order
 Map them to strings in the format “7 is a lucky number”
 Print the resulting array, one item per line
 So, your output should be as follows:

 7 is a lucky number
 15 is a lucky number
 21 is a lucky number
 31 is a lucky number
 33 is a lucky number
 49 is a lucky number
 If you need hints they are below, but honestly you should be able to tackle this one either from memory or by referencing recent chapters in this book.
 */


let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]


let luckyOddNumbers = luckyNumbers.filter { number in
    if number % 2 == 0 {
        return false
    }
    else {
        return true
    }
}.sorted {
    $0 < $1
}.map { number in
    return "\(number) is a lucky number"
}
print(luckyOddNumbers)

