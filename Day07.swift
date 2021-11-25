import UIKit
/*
 DAY 7 - Functions, PT.1
 */

func multiply(num: Int,by: Int) -> Int{
    let result = num*by

    return result;
}
multiply(num: 1, by: 2)

func divide(num: Int, by: Int) -> Int{
    let result = num/by

    return result;
}

divide(num: 12, by: 3)
multiply(num: divide(num: 12, by: 4), by: 2)


func rollDice() -> Int {
    return Int.random(in: 1...6)
}
let result = rollDice()
print(result)

func sameLetters(s1: String,s2: String)->Bool{
    s1.sorted() == s2.sorted()                  // since its only one line of code we do not need to return, it knows to return the value
    return s1.sorted() == s2.sorted()

    for i in s1 {
        if s2.contains(i){
            result = true
            break
        }
        else{
            continue
        }
    }
    return result
    
}
var s1 = "String"
var s2 = "String"
sameLetters(s1: s1, s2: s2)

func pythagorus(a: Double, b: Double) -> Double{
    sqrt((a*a+b*b))
}
var a = pythagorus(a: 3, b: 4)
print(a)

func greet(name: String) -> String {
    name == "Taylor Swift"
    ?"oh wow" : "hello \(name)"
}

print(greet(name: "Taylor Swift"))


/**********************************************************************************************************************************************************************************/
 
                                        func getName() -> (firstName: String, lastName: String){
                                                          (firstName: "Taylor", lastName: "Swift")            }
/*DESTRUCTURING A TUPLE*/
                                        let (firstName, lastName) = getName()
                                        print(firstName, lastName)

/**********************************************************************************************************************************************************************************/



func getUser() -> (firstNameUser: String, lastNameUser: String) {
    ("User", "2")
}

let (firstNameUser, lastNameUser) = getUser()
print(firstNameUser,lastNameUser)


var score = (10,"winner")
//score = (10, 10)

print(score.0)

func isUppercase(_: String) -> Bool {
    string==string.uppercased()
}

let string = "HELLO, WORLD"
isUppercase(string)

func printTimesTable(for num: Int) {            //adding an external name(for) for the paramater while still keeping internal parameter call                                                    (num) syntactically logical
    for i in 1...12 {
            print("\(i) x \(num) = \(i*num)")
    }
}

print
printTimesTable(for: 6)



func multiplyBy(by:Int)->Int{
    let num = 5
    return num*by
}
multiplyBy(by: 5)

func multiplyBy(_ num: Int)->Int{
    5*num
}
multiplyBy(5)

