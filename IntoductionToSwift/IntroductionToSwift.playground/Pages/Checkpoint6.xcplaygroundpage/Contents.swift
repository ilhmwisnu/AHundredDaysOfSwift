//: [Previous](@previous)

import Foundation

struct Album {
    var title: String
    var artist: String
    var year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

//struct Employee {
//    let name: String
//    var vacationRemaining: Int = 14
//
//    mutating func takeVacation(days: Int) {
//        if vacationRemaining > days {
//            vacationRemaining -= days
//            print("I'm going on vacation!")
//            print("Days remaining: \(vacationRemaining)")
//        } else {
//            print("Oops! There aren't enough days remaining.")
//        }
//    }
//}
//
//
//var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
//archer.takeVacation(days: 5)
//print(archer.vacationRemaining)
//
//var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 14)
//var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)
//var wisnu = Employee(name: "Wisnu")

struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }

        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)

struct BankAccount {
    private(set) var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

struct User {
    let email : String
    let password :  String
    
    static let example  = User(email: "user123", password: "password")
}

struct AppData {
    static let baseUrl = "www.ilhamwisnu.com"
}

struct Car {
    let model : String
    let numberOfSeats : Int
    private(set) var currentGear : Int
    
    init(model: String, numberOfSeats: Int, currentGear: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        
        let gear : Int = currentGear > Self.maxGear ? 10 : currentGear < Self.minGear ? 1 : currentGear
        
        self.currentGear = gear
    }
    
    static let maxGear = 10
    static let minGear = 1
    
    mutating func addGear(gear: Int) {
        let newValue = currentGear + gear
        
        if newValue > Self.maxGear || newValue < Self.minGear {
            print("Gear must in range of 1 to 10")
            return;
        }
        
        currentGear = newValue
    }
}

var newCar = Car(model: "asd", numberOfSeats: 123, currentGear: 120)

newCar.addGear(gear: 2)

print(newCar.currentGear)

//: [Next](@next)
