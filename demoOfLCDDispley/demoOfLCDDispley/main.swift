//
//  main.swift
//  demoOfLCDDispley
//
//  Created by Marek Pridal on 27.04.17.
//  Copyright (c) 2017 marekpridal. All rights reserved.
//

import Foundation

print("Write your phrase")

guard let string = readLine() else
{
    print("Cannot read your line")
    exit(2)
}

let characters = Array(string.characters)
var iterator = 0
let length = characters.count

for _ in 0..<length
{
    iterator += 1
    var i = 0
    while i < iterator
    {
        print(characters[i])
        i += 1
    }
    print("-------------------")
}
