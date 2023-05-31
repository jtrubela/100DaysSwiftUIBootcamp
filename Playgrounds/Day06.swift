import UIKit
/*
        Day 6: Loops
 */

for i in 1...12 {
    print("The \(i) times table:")
    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }
    print(" index i is \(i)")
}

let names = ["Piper", "Alex", "Suzanne", "Gloria"]
//We could read out an individual name like this:
print(names[0])

//With ranges, we can also print a range of values like this:
print(names[1...3])
//That carries a small risk, though: if our array didn’t contain at least four items then 1...3 would fail.

//Fortunately, we can use a one-sided range to say “give me 1 to the end of the array”, like this:
print(names[1...])


var roll = 0

while roll != 20{
    roll = Int.random(in: 1...20)
        print("not enough damage done")
}
print("Critical hit")


var page: Int = 0
while page <= 5 {
    page += 1
    print("I'm reading page \(page).")
}

/*
 CHECKPOINT 3
 Your goal is to loop from 1 through 100, and for each number:

 If it’s a multiple of 3, print “Fizz”
 If it’s a multiple of 5, print “Buzz”
 If it’s a multiple of 3 and 5, print “FizzBuzz”
 Otherwise, just print the number.
 */
var range = 100

for num in 1...100{
    if (num%5==0 && num%3 != 0){
        print("\(num): buzz")
    }
    else if (num%3==0 && num%5 != 0){
        print("\(num): fizz")
    }
    else if (num%3==0 && num%5 == 0 || num.isMultiple(of: 5) && num.isMultiple(of: 3)){
        print("\(num): fizz buzz")
    }
    else {
        print(num)
    }
}
