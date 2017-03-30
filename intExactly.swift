//
//  main.swift
//  intExactlyDoubles
//
//  Created by Marek Pridal on 30.03.17.
//  Copyright © 2017 Marek Pridal. All rights reserved.
//

import Foundation

func intExactly(_ number:Double) -> Bool
{
    if Int(exactly: number) != nil
    {
        return false
    }else
    {
        return true
    }
}
/*-----------------------------------------------------------------------------------------------------*/

print("Write your double number")
guard let input = readLine() else
{
    print("Wrong input")
    exit(1)
}

guard var number = Double(input) else
{
    print("Input is not a number")
    exit(1)
}

var descNumebers:Int = 0

while intExactly(number)
{
    number *= 10
    descNumebers += 1
}

print(".\(descNumebers)")
