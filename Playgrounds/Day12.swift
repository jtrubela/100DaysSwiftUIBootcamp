/*  DAY 12 - classesCLASSESclasses */

class Game {
    var userName = "jtrubela"
    var email = "jtrubela@netscape.com"
    
    
    var score = 0{
        didSet {
            print("Score is now \(score)")
        }
    }
    func getScore() {
        print("score is: \(score)")
    }
}

var newGame = Game()
newGame.score += 10


var newGameCopy = newGame

newGameCopy.score += 10
newGame.getScore()
newGameCopy.getScore()

newGame.score == newGameCopy.score

class VideoGame: Game {
    func getUserName(){
        print(userName)
    }
    func changeUsername(to newUserName: String) -> String{
        userName = newUserName
        return userName
    }
}


class Employee {
    var name = "Anonymous"
    var badgeNumber = 0
    
    init(name: String, badgeNumber: Int) {
        self.name = name
        self.badgeNumber = badgeNumber
    }
    init(name: String) {
        self.name = name
    }
    func work(){
        print("I'm shuffling some papers")
    }
}

final class Manager: Employee {
    override func work() {
        print("I am managing people")
    }
}

final class Developer: Employee {
    override func work() {
        print("Im writing some code")
    }
}

var leadDeveloper = Developer.init(name: "Justin", badgeNumber: 12)
leadDeveloper.work()
var departmentManager = Manager(name: "Justine")
departmentManager.work()


// HOW TO ADD INITIALIZERS FOR CLASSES

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
       // self.isElectric = isElectric               IS WRONGGGGGG
        super.init(isElectric: isElectric)          // You need to call a super call to its parent class
    }
}

class Student {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class UniversityStudent: Student {
    var annualFees: Int
    init(name: String, annualFees: Int) {
        self.annualFees = annualFees
        super.init(name: name)
    }
}

class Instrument {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Piano: Instrument {
    var isElectric: Bool
    init(isElectric: Bool) {
        self.isElectric = isElectric
        super.init(name: "Piano")
    }
}


// HOW TO COPY CLASSES
// ALL COPIES OF A CLASS INSTANCE SHARE THE SAME DATA, MEANING THAT ANY CHANGES YOU MAKE TO ONE COPY WILL AUTOMATICALLY CHANGE THE OTHER COPIES

class User {
    var userName = "Anonymous"
}

var user0 = User()
var user3 = user0               // HERE IS THE COPY
user3.userName = "Taylor"

print(user1.userName)
print(user3.userName)


/// it allows us to share common data in alot of parts of our program
///to bypass this -- "Deep copy" --- by creating a function within our class called copy and returning a copy of our class


class AnotherUser {
    var userName = "Anonymous"

    func copy() -> AnotherUser {
        let user = AnotherUser()
        user.userName = userName
        return user
    }
}

var user1 = AnotherUser()
var user2 = user1.copy()             //HERE IS THE COPY
user2.userName = "Taylor"

print(user1.userName)
print(user2.userName)


class Author {
    var name = "Anonymous"
}
var dickens = Author()
dickens.name = "Charles Dickens"
var austen = dickens
austen.name = "Jane Austen"
print(dickens.name)
print(austen.name)


///////////////  HOW TO CREATE A DEINITIALIZER FOR A CLASS ------------------NO PARENTHESIS
/// DEINITIALIZER DESTROYS AN OBJECT
///Just like initializers, you don’t use func with deinitializers – they are special.
///Deinitializers can never take parameters or return data, and as a result aren’t even written with parentheses.
///Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
///We never call deinitializers directly; they are handled automatically by the system.
///Structs don’t have deinitializers, because you can’t copy them.
///
 

class Userss {
    let id: Int

    init(id:Int) {
        self.id=id
        print("User \(id): I'm alive!")
    }
    deinit{
        print("User \(id): I'm dead!")
    }
}
var users = [Userss]()

for i in 1...3 {
    let user = Userss(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear")


//HOW TO WORK WITH VARIABLES INSIDE CLASSES
///Variable classes can have variable properties changed
///Constant classes can have variable properties changed
///Variable structs can have variable properties changed
///Constant structs cannot have variable properties changed

class Users {
    var name = "Paul"
}

var user = Users()           // NOT THE SAME AS              let user = User()
user.name = "Taylor"
user = Users()
print(user.name)


class Pizza {
    private var toppings = [String]()
    func add(topping: String) {
        toppings.append(topping)
    }
}
var pizza = Pizza()
pizza.add(topping: "Mushrooms")

class Kindergarten {
    var numberOfScreamingKids = 30
    func handOutIceCream() {
        numberOfScreamingKids = 0
    }
}
let kindergarten = Kindergarten()
kindergarten.numberOfScreamingKids
kindergarten.handOutIceCream()
kindergarten.numberOfScreamingKids


/*  SUMMMARYYYY*/
///Classes have lots of things in common with structs, including the ability to have properties and methods, but there are five key differences between classes and structs.
///First, classes can inherit from other classes, which means they get access to the properties and methods of their parent class. You can optionally override methods in child classes if you want, or mark a class as being final to stop others subclassing it.
///Second, Swift doesn’t generate a memberwise initializer for classes, so you need to do it yourself. If a subclass has its own initializer, it must always call the parent class’s initializer at some point.
///Third, if you create a class instance then take copies of it, all those copies point back to the same instance. This means changing some data in one of the copies changes them all.
///Fourth, classes can have deinitializers that run when the last copy of one instance is destroyed.
///Finally, variable properties inside class instances can be changed regardless of whether the instance itself was created as variable.



/* Checkpoint 7*/
///make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.
///But there’s more:

///The Animal class should have a legs integer property that tracks how many legs the animal has.
///The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
///The Cat class should have a matching speak() method, again with each subclass printing something different.
///The Cat class should have an isTame Boolean property, provided using an initializer.


// Parent class for Animals with initializer for number of legs
class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}


//Child of Parent...but parent to Corgi and Poodle
class Dog: Animal {
    override init(legs: Int) {
        super.init(legs: 4)
    }
    func speak(){
        print("Woof Woof")
    }
}

final class Corgi: Dog {
}
var corgi = Corgi(legs: 4)
corgi.speak()

final class Poodle: Dog {
}
var poodle = Poodle(legs: 4)
poodle.speak()

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    func speak() {
        print("Meow")
    }
}
var cat = Cat(isTame: true, legs: 3)
cat.speak()

final class Persian: Cat {
    //already domesticated so no need for an overridden isTame initializer but needs one on initialization
//    override init(isTame: Bool, legs: Int) {
//      super.init(isTame: true, legs: 4)             //ONLY IF YOU WANTEDD
//    }
    //Already meows given it is a child of Cat
//    override func speak() {
//        print("Meow")
//    }

}
var persian = Persian(isTame: true, legs: 4)
print(persian.speak())
print(persian.isTame)

final class Lion: Cat {
    override init(isTame: Bool, legs: Int) {
        super.init(isTame: false, legs: 4)
    }
    override func speak() {
        print("Roar")
    }
}
var lion = Lion(isTame: false, legs: 4)
lion.speak()

