//: # Swift Exercise
//: Welcome to the Swift Exercise. This document is an interactive Playground. The goal of this exercise is to familiarize yourself with the Swift syntax, terminology and concepts.
//:
//: If this text you're currently reading is being displayed as a code comment with `//:`, you can make it look prettier by selecting `Editor` --> `Show Rendered Markup` in the menu bar at the very top of your screen. You can switch back to the raw markup by clicking `Editor` --> `Show Raw Markup`. The document is designed to be viewed in Rendered Markup mode.
//:
//: You can type your Swift code in here and it'll automatically compile.
//: If the automatic compilation annoys you, you can turn it off by clicking-and-holding your mouse on the "Play" icon in the toolbar below. Then, select `Manually Run`.
//:
//: If you need help or have any questions, please feel free to contact me. You can find my contact info on the [course website](https://avf.github.io/mobile-app-dev/). I'm always happy to help!
//:
//: ## How to do the exercises
//: - Follow the instructions for the exercises.
//: - Please write any code that I ask for right into the playground.
//: - Any time I ask a question in an exercise, **please add a comment with the explanation in your own words.**
//:
//: Here's an example:
//:
//: Write a Hello World program in Swift in a single line. Why is this a valid Swift program?

print("Hello, World!")  // This works because Swift programs by default execute statements in the global scope. A `main` function or similar is not required.

//: ## Exercises
//: ### Variables and Constants
//: 1. Declare a variable with value `42` that is implicitly assigned type `Int`.
//: 1. Declare a constant with value `42` that is implicitly assigned type `Int`.
//: 1. Declare a variable with value `42.5`. What type does it have?
//: 1. Declare a variable with explicit type `Float` and value `42.5`.
//: 1. Declare an uninitialized constant with type `String`. Will you ever be able to assign a value to this constant?

var a = 42  // This variable is implicitly assigned type Int
let b = 42  // This constant is implicitly assigned type Int
var c = 42.5
var typeOfC = type(of: c)
print(typeOfC)  //The type of c is Double, because Swift defaults to Double for floating point literals.

var d: Float = 42.5  // This variable is explicitly assigned type Float
let e: String  // This constant is uninitialized and will be able to be assigned a value for the first time, but after that it will be immutable and cannot be changed again.

e = "Hello Lindrit "

print(e)  // This will print "Hello Lindrit " to the console

//e = "Hello again" // This will throw an error because `e` is a constant and cannot be reassigned after its initial assignment.
// - error: immutable value 'e' may only be initialized once
a = 40

print(a)  // This will print "40" to the console, because the variable `a` was changed from 42 to 40.

//: ### Strings and String interpolation
//: 1. Create a constant of type `String` containing the text `"This is a String."`.
//: 1. Create a mutable String with `"This is an Int: "` as its initial value.
//: 1. Create an `Int` constant with value 42 and append it to the mutable string, resulting in the value: `"This is an Int: 42"`.
//: 1. Create another constant containing the same string, but this time use a string literal and string interpolation (the `\()` syntax) to create it.
//: 1. Create a multiline string using the musltiline string literal.

let constString: String = "This is a String."
var mutableString: String = "This is an Int: "
let intConst: Int = 42

// mutableString = mutableString + intConst (cannot convert value of type 'Int' to expected argument type 'String')

mutableString = mutableString + String(intConst)  // This will convert the Int to a String and append it to the mutableString

print(mutableString)  // This will print "This is an Int: 42" to the console

let anotherConstString: String = "This is an Int: \(intConst)"  // This will use string interpolation to create the same string as above
print(anotherConstString)  // This will print "This is an Int: 42" to the console

var multilineString: String = """
    This is a multiline string.
    It spans multiple lines. Yay! 
    """

print(multilineString)  // This will print the multiline string to the console

//: ### Arrays and Dictionaries
//: Arrays
//: 1. Create an immutable array and initialize it with an array literal containing 3 `String` elements
//: 1. Create an empty mutable array of type `[String]`
//: 1. Append the second element of the first (immutable) array to the second (mutable) array.
//: 1. Can you modify one of the `String` elements in the first array (for example, append a word to it)? Why/why not? What if the elements were not of type `String`, but instead of a class?
//: 1. What happens if you modify the `String` element in the second array (for example, if you append a word to it)? Will the second element in the first array also change, or stay the same? Explain why.
//: 1. Create an immutable empty array of type `[Int]` without any literals, using the name of the class (`Array`) and the standard initializer for generic types (`var value = ClassName<GenericType>()`)

let immutableStringArray: [String] = ["Hello", "Lindrit", "Prekaj"]
var mutableStringArray: [String] = []

mutableStringArray.append(immutableStringArray[1])

print(mutableStringArray)

//immutableStringArray[0] = "Bye" //- error: cannot assign through subscript: 'immutableStringArray' is a 'let' constant. It can not be modified because it is declared as a constant using `let`.

class Friend {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let immutableClassArray: [Friend] = [
    Friend(name: "Lindrit"), Friend(name: "Rina"), Friend(name: "Nero"),
]

immutableClassArray[0].name = "Dorina"  // This is allowed because the array does not hold the objects themselves, only references to them. `let` freezes those references, but the objects they point to can still be changed.

//immutableClassArray[0] = Friend(name: "Dorina") //- error: cannot assign through subscript: 'immutableClassArray' is a 'let' constant. Replacing an element would change a reference, and the references are frozen by `let`.

print(immutableClassArray[0].name)  // This will print "Dorina" to the console

mutableStringArray[0] += " Prekaj"

print("Second Array: " + mutableStringArray[0])

print("First Array: " + immutableStringArray[1])  // This will print "Lindrit" to the console, because the second element in the first array is a separate instance of the String object and is not affected by changes made to the second array.

let immutableIntArray: [Int] = Array<Int>()

// My appending something in the second array we do not affect it in the first array. It got copied to the second array and thus it can not interfere with the first array

//: Dictionaries
//: 1. Create a mutable empty Dictionary of type `[String: Double]`
//: 1. Set the value for the key `"Answer to Life, the Universe and Everything"` to `42`.

var mutableDictionary: [String: Double] = [:]
mutableDictionary["Answer to Life, the Universe and Everything"] = 42.0

print (mutableDictionary)  

//: ### Optionals
//: 1. Create an optional `String` variable and assign a non-nil value of your choice
//: 1. Print the String on the console. Make sure the variable is first unwrapped and only the actual value is printed. You may either force-unwrap the string or use an `if let` construct.
//: 1. What happens if you force-unwrap an optional variable that contains `nil`?
//: 1. Create another optional `String` variable and asign the value `nil`. Use the nil coalescing operator (`??`) to print the first unwrapped String from above.
//: 1. Do the same thing again, but this time use the ternary conditional operator `(a ? b : c)`.


var optionalString: String? = "Hello, Lindrit"

print(optionalString!)  

var optionalInt: Int? = nil

//print(optionalInt!) //Fatal error: Unexpectedly found nil while unwrapping an Optional value
// Force-unwrapping an optional that contains `nil` crashes the program while it is running. The compiler does not warn about this beforehand, because it cannot know that the value will be `nil` at that moment. That is why `!` should only be used when you are sure a value exists, and `if let` or `??` are the safer choice otherwise.

var anotherOptionalString: String? = nil



print(anotherOptionalString ?? optionalString!)  // This will print "Hello, Lindrit" to the console, because `anotherOptionalString` is `nil`, so the nil coalescing operator returns the value of `optionalString!`.
//anotherOptionalString = "Hello, Rina"
print(anotherOptionalString != nil ? anotherOptionalString! : optionalString!)

//: Optional chaining
//: 1. Consider the following `struct`. Use optional chaining to change the value of `anOptionalInt` in `instance` to a new value of your choice in a single line of code. What would happen if we executed that line while `instance` is `nil`?
//: 1. Use the `if let` conditional and optional chaining to print the value of `anOptionalInt` in `instance`. What would happen if `instance` or `anOptionalInt` were `nil`?
//: 1. Use optional chaining to call the method `sayHelloWorld` of `instance`. What would happen if `instance` were `nil`?

struct MyStruct {
    var anOptionalInt: Int? = 5

    func sayHelloWorld() {
        print("Hello, World!")
    }
}

var instance: MyStruct? = MyStruct()

//print(instance!.anOptionalInt!)
 instance?.anOptionalInt = 10  // This will change the value of `anOptionalInt` to 10. If `instance` were `nil`, this line would do nothing and not cause a runtime error.

print(instance?.anOptionalInt ?? "instance is nil") 

if let anOptionalInt = instance?.anOptionalInt {
    print(anOptionalInt)  // This will print "10" to the console. If `instance` or `anOptionalInt` were `nil`, the whole chain `instance?.anOptionalInt` would be `nil`, so this block would be skipped and the `else` block would run instead.
} else {
    print("instance or anOptionalInt is nil")  // Only runs if the chain returned `nil`. Without an `else` block, nothing would be printed and the program would continue without a crash.
}

//instance = nil
print("---")
instance?.sayHelloWorld()  // This will print "Hello, World!" to the console. If `instance` were `nil`, this line would do nothing and not cause a runtime error.


//: ### Control flow
//: 1. Write a `for-in` loop that sums up all the values in `myNumbers`.
//: 1. Create an empty mutable `[Int: Int]` dictionary. Use a `for-in` loop to iterate over the elements in `myNumbers` and add each value to the dictionary, using the index of each element in `myNumbers` as its key. So for example, the dictionary should contain the key/value pair `0:12`, because 12 is element 0 of `myNumbers`.

let myNumbers = [12, 23, 1, 104]

var sum = 0
for number in myNumbers {
    sum += number
}
print(sum)  // This will print "140" to the console

var numbersByIndex: [Int: Int] = [:]
for (index, number) in myNumbers.enumerated() {  // `enumerated()` gives us the index and the element at the same time
    numbersByIndex[index] = number
}
print(numbersByIndex)  // Contains 0: 12, 1: 23, 2: 1, 3: 104. The printed order can differ, because dictionaries have no fixed order.

//: ### Functions and Closures
//: Functions
//: 1. Declare and call a function without any parameters or return type that prints Hello World.
//: 1. Declare and call a function that takes two strings as parameters and returns a string. Remember that in Swift, most funtions have argument labels. Make sure to include them, you don't need to modify the argument labels in any way.
//: 1. Declare and call a function with the same signature (two strings as parameters and returns a string), but this time remove the first argument label.
//: 1. Declare and call a function with the same signature (two strings as parameters and returns a string), but this time make the first argument label **different** from the parameter name (=use a custom argument label).
//: 1. Declare a function with a default parameter value. Call the function twice, once with the argument present, once without.
//: 1. Declare a function with name `callAFunction` that takes another function as parameter and then executes it. Call your newly declared `callAFunction` and pass in one of the functions you previously declared.

func printHelloWorld() {
    print("Hello World")
}
printHelloWorld()

func combine(first: String, second: String) -> String {
    return "\(first) \(second)"
}
print(combine(first: "Hello", second: "World"))  // By default, the parameter names are also used as argument labels

func combineWithoutFirstLabel(_ first: String, second: String) -> String {
    return "\(first) \(second)"
}
print(combineWithoutFirstLabel("Hello", second: "World"))  // `_` removes the argument label, so we call it without `first:`

func combineWithCustomLabel(startingWith first: String, second: String) -> String {
    return "\(first) \(second)"  // Inside the function we still use the parameter name `first`
}
print(combineWithCustomLabel(startingWith: "Hello", second: "World"))  // Outside we use the argument label `startingWith:`

func sayHello(to name: String = "World") {
    print("Hello, \(name)!")
}
sayHello(to: "Lindrit")  // This will print "Hello, Lindrit!"
sayHello()  // This will print "Hello, World!", because the default value is used

func callAFunction(function: () -> Void) {
    function()
}
callAFunction(function: printHelloWorld)  // We pass the function itself without `()`, so it is not called here but inside `callAFunction`

//: Closures
//: 1. Create an optional variable that holds a closure (with a `String` parameter and no return type) and assign `nil`.
//: 1. Call the closure using optional chaining. What will happen?
//: 1. Create a `typealias` for this type of closure.

var optionalClosure: ((String) -> Void)? = nil  // The extra brackets are needed. `(String) -> Void?` would be a closure that returns an optional.

optionalClosure?("Hello")  // Nothing happens. The closure is `nil`, so the call is skipped, just like optional chaining on a method. It does not crash.

typealias StringHandler = (String) -> Void

var printingClosure: StringHandler? = { text in print(text) }
printingClosure?("Hello from a closure")  // This closure is not `nil`, so it gets called and prints the text

//: 1. Take a look at the following function, which takes a closure as parameter and calls it. This function is then called. For each of the following exercises, call the function again, but each time use one more simplification:
//:   * Omit closure parameter types.
//:   * Omit the closure return type
//:   * Omit the round brackets and argument label (we can do that since it's the last function parameter)
//:   * Omit the closure parameters completely. In the closure body, use the shorthand argument names (for example `$0`)
//:   * Omit the keyword `return`

func callAClosure(closure: (String, String) -> String) {
    print(closure("Hello", "World"))
}
callAClosure(closure: { (item1: String, item2: String) -> String in
    return "\(item1) \(item2)"
})

// 1. Omit closure parameter types: Swift already knows them from `callAClosure`'s signature
callAClosure(closure: { (item1, item2) -> String in
    return "\(item1) \(item2)"
})

// 2. Omit the closure return type: Swift also knows that it has to return a `String`
callAClosure(closure: { (item1, item2) in
    return "\(item1) \(item2)"
})

// 3. Trailing closure: the closure is the last parameter, so it can be written after the round brackets
callAClosure { (item1, item2) in
    return "\(item1) \(item2)"
}

// 4. Shorthand argument names: `$0` is the first parameter, `$1` the second
callAClosure {
    return "\($0) \($1)"
}

// 5. Omit `return`: a closure with a single expression returns its result automatically
callAClosure { "\($0) \($1)" }

//: ### Classes
//: 1. Create a new class named `Person`. Add non-optional `firstName` and `lastName` properties and an initializer.
//: 1. Add a `name` computed property that returns a `String` containing the first and last name.
//: 1. Add a method named `greet` that returns the following `String`: `"Hi, I'm \(name)."`
//: 1. Create a subclass of `Person` and name it `Student`.
//: 1. Add a `Float?` optional property called `grade`. Use the `didSet` property observer to make sure that the grade is not lower than 1.0 and not higher than 5.0 after it was set. Clamp the new value to this interval - so if a value higher than 5.0 is set, set it to 5.0 afterwards. If a value lower than 1.0 is set, set it to 1.0 afterwards.
//: 1. Override the `greet` function from the superclass. If the `grade` property is set, it should now return `"Hi, I'm \(name). My grade is: \(grade)"`. If the `grade property isn't set, return the superclass's implementation.

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    var name: String {  // Computed property: it has no stored value and is recalculated every time it is read
        return "\(firstName) \(lastName)"
    }

    func greet() -> String {
        return "Hi, I'm \(name)."
    }
}

class Student: Person {  // `Student` inherits all properties, the initializer and `greet` from `Person`
    var grade: Float? {
        didSet {
            if let grade {
                self.grade = min(max(grade, 1.0), 5.0)  // Setting the property inside its own `didSet` does not trigger `didSet` again
            }
        }
    }

    override func greet() -> String {
        if let grade {
            return "Hi, I'm \(name). My grade is: \(grade)"  // Unwrapped first, otherwise it would print "Optional(2.0)"
        }
        return super.greet()
    }
}

let person = Person(firstName: "Max", lastName: "Mustermann")
print(person.greet())  // This will print "Hi, I'm Max Mustermann."

let student = Student(firstName: "Erika", lastName: "Musterfrau")
print(student.greet())  // No grade set yet, so this uses the superclass's implementation: "Hi, I'm Erika Musterfrau."

student.grade = 7.0
print(student.greet())  // 7.0 is too high and gets clamped: "Hi, I'm Erika Musterfrau. My grade is: 5.0"

student.grade = 0.3
print(student.greet())  // 0.3 is too low and gets clamped: "Hi, I'm Erika Musterfrau. My grade is: 1.0"

student.grade = 2.3
print(student.greet())  // 2.3 is inside the interval and stays unchanged: "Hi, I'm Erika Musterfrau. My grade is: 2.3"

//: ### Enums and Structs
//: 1. Create an enum named `PetType` with cases `dog` and `cat`
//: 1. In your new enum, create a function or computed property named `animalSound` that returns a `String`. Use a `switch` statement on `self` to differentiate between the cases and return `"woof"` for the `.dog` case and `"meow"` for the `.cat` case.
//: 1. Create a structure named `Pet`, with a `name` property of type `String` and a `type` constant of type `PetType` (both non-optional).
//: 1. Add a function to your structure named `makeNoise` that returns a `String`. In its implementation, return the `animalSound` of its `type`.
//: 1. Create 3 or more instances of your `Pet` struct and store them in `let` constants. Then create a new array that contains all your pets and store it in a variable.
//: 1. Change one of the names of the pets in your array. Does this change the name of any of the pets stored in the `let` constants? Explain why/why not.
//: 1. Can you change the name of one of the pets stored in the `let` constants? Explain why/why not.
//: 1. Create 3 or more instances of your `Student` class from above and store them in `let` constants. Then create a new array that contains all your students and store it in a variable.
//: 1. Change one of the names of the students in your array. Does this change the name of any of the students stored in the `let` constants? Explain why/why not.
//: 1. Can you change the name of one of the students stored in the `let` constants? Explain why/why not.

enum PetType {
    case dog
    case cat

    var animalSound: String {
        switch self {
        case .dog:
            return "woof"
        case .cat:
            return "meow"
        }
    }
}

struct Pet {
    var name: String
    let type: PetType

    func makeNoise() -> String {
        return type.animalSound
    }
}

let bello = Pet(name: "Bello", type: .dog)
let luna = Pet(name: "Luna", type: .cat)
let rex = Pet(name: "Rex", type: .dog)

var pets = [bello, luna, rex]
print(luna.makeNoise())  // This will print "meow"

pets[0].name = "Max"
print(pets[0].name)  // This will print "Max"
print(bello.name)  // This will still print "Bello". `Pet` is a struct, which is a value type. When the pets were put into the array, they were copied. Changing the copy in the array does not affect the original in the constant.

//bello.name = "Max" //- error: cannot assign to property: 'bello' is a 'let' constant. A struct in a `let` constant is completely immutable, even its `var` properties, because the properties are part of the struct's value.

let anna = Student(firstName: "Anna", lastName: "Berg")
let ben = Student(firstName: "Ben", lastName: "Kraus")
let clara = Student(firstName: "Clara", lastName: "Wolf")

var students = [anna, ben, clara]

students[0].firstName = "Annika"
print(students[0].name)  // This will print "Annika Berg"
print(anna.name)  // This will also print "Annika Berg". `Student` is a class, which is a reference type. The array does not contain copies, only references to the same objects as the constants. So `students[0]` and `anna` are the same object.

ben.firstName = "Benjamin"
print(ben.name)  // This will print "Benjamin Kraus". This is allowed, because `let` only freezes the reference to the object, not the object itself. The object's `var` properties can still be changed.

//anna = Student(firstName: "Dora", lastName: "Stein") //- error: cannot assign to value: 'anna' is a 'let' constant. What we can not do is make the constant point to a different object.

//: ### Protocols and extensions
//: 1. Create a protocol called `NamedThing`. Add a `get` variable of type `String`, with the name `name`.
//: 1. Use extensions to make your `Person` class and `Pet` structs from above conform to the new protocol.
//: 1. Create a new array that contains all the objects you declared as `let` constants above. You may have to explicitly specify the type of the array as `[NamedThing]`.
//: 1. Iterate over the objects in the array and print out their names.
//: 1. Create a protocol extension for `NamedThing` that contains a new computed property of type `String` called `initial`. Add a default implementation in your protocol extension, which returns the first character of the `name` property, or, if `name` is empty, an empty string.
//: 1. Print the new `initials` property in the loop you created above.

protocol NamedThing {
    var name: String { get }  // `get` means conforming types must at least be able to read `name`. It may be stored or computed.
}

extension Person: NamedThing {}  // Empty, because `Person` already has a computed `name` property. `Student` conforms automatically as a subclass.
extension Pet: NamedThing {}  // Empty, because `Pet` already has a stored `name` property

let namedThings: [any NamedThing] = [bello, luna, rex, anna, ben, clara]  // `any NamedThing` is the modern way to write `NamedThing` as a type. The array can mix structs and classes, as long as they conform to the protocol.

extension NamedThing {
    var initial: String {  // Default implementation: every type that conforms to `NamedThing` gets this property for free
        if let firstCharacter = name.first {  // `first` is optional, because an empty String has no first character
            return String(firstCharacter)
        }
        return ""
    }
}

for thing in namedThings {  // The loop for points 4 and 6: it prints the name and the new `initial` property
    print("\(thing.name) (\(thing.initial))")
}
