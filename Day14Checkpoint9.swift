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
