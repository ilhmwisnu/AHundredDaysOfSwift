var greeting = "Hello, playground"

greeting = "Hello, World!"

let age: Int = 23

var name: String = "Wisnu"
var fileName: String = "hello.swift"

print(name.count)

print(name.uppercased())

print(fileName.hasSuffix(".swift"))

var score = 10

var reallyBigNumber = 1_000_000_000

var lowerScore = score - 1
var higherScore = score + 1
var doubledScore = score * 2
var squaredScore = score * score
var halfScore = score / 2
print(score)

var counter = 1

counter = counter + 1

counter += 1

print(counter)

counter *= 2

counter /= 2

print(counter)

print(counter.isMultiple(of: 3))

var a = 1
var b = 2.0

var c = a + Int(b)
var d = Double(a) + b

var rating = 4.2

rating *= 2

var isAuthenticated: Bool = true

isAuthenticated = !isAuthenticated

isAuthenticated.toggle()

var firstName = "Ilham"
var lastName = "Wisnu"

var fullName = firstName + " " + lastName

print(fullName)

name = "Taylor"
let agee = 26
let message = "Hello, my name is \(name) and I'm \(agee) years old."

print(message)

print("5 x 5 is \(5 * 5)")

var celciusDegree: Double = 25.0

var fahrenheitDegree: Double = (celciusDegree * 9 / 5) + 32

print("\(celciusDegree)° Celcius is equal to \(fahrenheitDegree)° Fahrenheit.")

var numbers : [Int] = [1,2,3,4,5]

numbers.append(6)

numbers = numbers.reversed()

print(type(of: Array(numbers.reversed())))

print(numbers)

numbers = numbers.sorted()

print(numbers)

numbers.removeAll()

print(numbers)

//Dictionary

var employe : [String:String] = [
    "Name" : "Ilham",
    "Location" : "Jakarta",
    "Position" : "Software Engineer"
]

print("Name: \(employe["Name"] ?? "Not Found")")
print("Location: \(employe["Location"] ?? "Not Found")")
print("Position: \(employe["Position"] ?? "Not Found")")

var setExample : Set<String> = ["a","b","c","a"]

print(setExample)

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var today : Weekday = .monday










