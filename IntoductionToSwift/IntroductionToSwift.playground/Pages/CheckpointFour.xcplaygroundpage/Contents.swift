import Foundation

func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)

let root = sqrt(169)
print(root)


func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)


func areLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
}

func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)

func getUser() -> [String] {
    ["Taylor", "Swift"]
}

func getUser1() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift"
    ]
}

func getUser2() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

func getUser3() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

let user2 = getUser2()
print("Name: \(user2.firstName) \(user2.lastName)")

func getUser4() -> (String, String) {
    ("Taylor", "Swift")
}

let user4 = getUser4()
print("Name: \(user4.0) \(user4.1)")


let (firstName, lastName) = getUser2()
print("Name: \(firstName) \(lastName)")

let (firstName2, _) = getUser2()
print("Name: \(firstName)")
