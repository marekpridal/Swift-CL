//: Playground - noun: a place where people can play

//Swift 3.1 new feature

import UIKit

func intExactly(_ number:Double) -> Int?
{
    return Int(exactly: number)
}

let a:Double = 2.2
let b:Double = 2

intExactly(a)
intExactly(2)
