//: [Previous](@previous)

import Foundation

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

class Employee {
    var hours : Int
    
    init(hours: Int) {
        self.hours = hours
    }
}

final class Developer: Employee {
    func work() {
        print("Working \(hours) hours")
    }
}

class HumanResource : Employee {
    func work() {
        print("HR working...\(hours) hours")
    }
}

let wisnu = Developer(hours: 10)
wisnu.work()

//class MobileDeveloper : Developer {
//    func work() {
//        print("Making mobile apps..for \(hours) hours")
//    }
//}


//: [Next](@next)
