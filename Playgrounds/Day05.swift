import UIKit
/*
    DAY 5: To be || !To be --- Switch and Ternary Operators
 */

enum Weather{
    case sun,rain,wind,snow,unknown
}

let forecast = Weather.sun

switch forecast{                                // switch replaces if/else statements
case .sun:      print("It should be a nice day.")
case .rain:     print("Pack an umbrella")
case .wind:     print("Wear a windbreaker")
case .snow:     print("clean your car off")
case .unknown:  print("Our forecast generator is broken");fallthrough
default:        print("blah")
}

let place = "metropolis"

switch place {
case "gotham":          print("You're Batman")
case "mega-city one":   print("You're Judge Dredd")
case "wakanda":         print("You're Black Panther")
default:                print("Who are you?")
}



//SWITCHES WITH INTEGER CASES

let day = 5
print("my true love gave to me")

switch day{
case 5:print("5 golden rings");fallthrough
case 4:print("4 calling birds");fallthrough
case 3:print("3 french hens");fallthrough
case 2:print("2 turtle doves");fallthrough
default:print("partidge in a pair tree")


var temp: Int  = 80
switch temp {
case 79: print("its not hot")
case 80: print("its nice out")
case 81: print("its hot")
default: print("temp gauge is broken")
}

// Ternary Conditional Operator
let isAuthenticated = true
//          What            True         False
print(isAuthenticated ? "Welcome!" : "Who are you?")
