//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

protocol Person: Equatable {
    var name : String { get set }
    func work()
}

struct Employee : Person {
    
    var name: String
    
    func work() {
        print("I'm working")
    }
}

extension Person {
    func sleep() {
        print("Sleeping")
    }
}

var wisnu = Employee(name: "Wisnu")
wisnu.sleep()


//Checkpoint 8

protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var name: String { get set }
}

extension Building {
    func summarize() {
        print("")
    }
}

struct House : Building {
    var cost: Int
    var name: String
    var rooms: Int
}

struct Office : Building {
    var cost: Int
    var name: String
    var rooms: Int
}
