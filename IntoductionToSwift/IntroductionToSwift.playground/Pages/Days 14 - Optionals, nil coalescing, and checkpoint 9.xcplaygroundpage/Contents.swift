//: [Previous](@previous)

import Foundation


var name : String? = nil

name = "Ilham"

if let name = name {
    print(name)
}

print("Done")

func getAddress() -> String? {
    var address : String? = nil

    guard let address = address else {
        print("Empty bro")
        return nil
    }
    
    return address
}

var addr = getAddress()

print(addr ?? "Kosong")


struct Human {
    var name : String?
}

var human : Human? = nil

print(human?.name ?? "Anonym")


// Checkpoint 9

func getNumber(arr : [Int]?) -> Int { return arr?.randomElement() ?? Int.random(in: 1...100)}

print(getNumber(arr: nil))
//: [Next](@next)
