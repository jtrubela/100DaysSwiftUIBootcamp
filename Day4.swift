/*
    DAY 4: COMPLEX DATA TYPES PT2 - Type annotation
                    "Good data structures and bad code works alot better than the other way around"
 */

var name: String = "Roy"
var score: Int = 0
var doubleScore: Double = 0

let playerNAme: String = "Ted"
var luckyNumber: Int = 13
let pi: Double = 3.14
var isAuthenticated: Bool = true

var albums: [String] = ["Red","Fearless"]
var user: [String: String] = ["id": "@jrtrubela"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system    }
enum daysOfWeek {   case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday     }
var today = daysOfWeek.Monday

var style: UIStyle = UIStyle.light
style = .dark

let userName: String
userName = "@jrtrubela"



 //CHECKPOINT 2: Create an array of string , then write some code that prints the number of items in the array and also the number of unique items in the array
 
 var myArray: [String] = ["I ", "just ","completed ", "my ", "4th ", "day", "of ", "hacking with ", "SwiftUI", "SwiftUI"]
 print(myArray)
 print("Number of items in array: \(myArray.count)")
 print("My array contains \"SwiftUI\": \(myArray.contains("SwiftUI"))")

 var myArraySet:Set = Set(myArray)
 print("Number of unique elements in my set: \(myArraySet.count)")

 print(myArraySet)

 
