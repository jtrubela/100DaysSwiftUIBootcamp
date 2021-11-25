import UIKit

/*
    DAY 8: Functions PT2: Handling errors
 */

//You can default any or all of the paramaters in your function by initializing them to a "default value"

func timesTable(for number: Int, range: Int = 10){
    for i in 0...range{
        print("\(number) * \(i) = \(number * i)")
    }
}
//timesTable(for: 5, range: 10)      =       timesTable(for: 5)

//swift gives enough memory to hold the array data plus a little extra
// sometimes you want to remove data but you know that your going to add alot more
// so to save time we call this to save some "time"
var array = ["Hello,", "this", "shows", "default", "value", "for", "arrays"]
array.count
array.removeAll(keepingCapacity: false)
array.count

/*
    HANDLING ERRORS IN FUNCTIONS
    Step1: define all the errors that might happen in the code were writing
    Step2: write a function that runs as normal but checks for these errors
    Step3: try and run that function and handle any errors that come back
 */

//Define errors
enum PasswordError: Error {
    case short, obvious
}

//Check for errors
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {throw PasswordError.short}
    if password == "12345" {throw PasswordError.obvious}

    if password.count < 8{
        return "ok"
    }
    else if password.count < 10 {
        return "good"
    }
    else {
        return "excelent"
    }
}
let string = "12345"

do {
    let result = try checkPassword(string)
    print("password rating: \(result)")
}
catch PasswordError.obvious{
    print("I have the same password on my luggage!")
}
catch PasswordError.short{
    print("Password must be greater than 5 characters")
}
catch{
    print("There was an error:  \(error.localizedDescription)")
}
checkPassword("123456")



/*
 Checkpoint 4
 We’ve covered a lot about functions in the previous chapters, so let’s recap:

 Functions let us reuse code easily by carving off chunks of code and giving it a name.
 All functions start with the word func, followed by the function’s name. The function’s body is contained inside opening and closing braces.
 We can add parameters to make our functions more flexible – list them out one by one separated by commas: the name of the parameter, then a colon, then the type of the parameter.
 You can control how those parameter names are used externally, either by using a custom external parameter name or by using an underscore to disable the external name for that parameter.
 If you think there are certain parameter values you’ll use repeatedly, you can make them have a default value so your function takes less code to write and does the smart thing by default.
 Functions can return a value if you want, but if you want to return multiple pieces of data from a function you should use a tuple. These hold several named elements, but it’s limited in a way a dictionary is not – you list each element specifically, along with its type.
 Functions can throw errors: you create an enum defining the errors you want to happen, throw those errors inside the function as needed, then use do, try, and catch to handle them at the call site.
 */


/*The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:
 
 -You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.

 -If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
 
 -You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
    If you can’t find the square root, throw a “no root” error.
 */

//Step1: declare a set of valid throw cases
enum squarerootError: Error { case noRoot, outOfBounds }

//Step2: Write the function that will catch the errors
func squareRoot(of number: Int) throws -> Int{
    var root = 0
    if number < 1 || number > 10_000{ throw squarerootError.outOfBounds }      //Catch error: OutOfBounds
    
  for i in 1...100{
        if i*i == number {
            root = i
            break
        }
        else if root == 0 && i == 100{ throw squarerootError.noRoot }
    }
    return root
}
//Step3: Call the function and handle the errors
let number = 100

do{    //Try finding the square root for the number given
    try squareRoot(of: number)
    print("There is a root for \(number): \(sqrt(Double(number)))")
}
//Catch all cases for an error
catch squarerootError.noRoot{
    print("No root")
}
catch squarerootError.outOfBounds{
    print("out of bounds")
}
catch{
    print("cannot compute")
}
