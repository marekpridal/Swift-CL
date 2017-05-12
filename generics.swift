//
//  main.swift
//  generics
//
//  Created by Marek Pridal on 11.05.17.
//
//

import Foundation

func swapTwoValues<T>(_ array: inout Array<T>)
{
    var size = array.count
    var newArray:Array<T> = []
    
    //set the size of array because of generic it must with for cycle
    for element in array
    {
        newArray.append(element)
    }
    //size - 1 because of indexing array from 0
    size -= 1
    //inserting into new array
    for element in array
    {
        newArray.insert(element, at: size)
        newArray.remove(at: size+1)
        size -= 1
    }
    
    //save swapped array into old one because of inout &parameter
    array = newArray
}

var numbers:Array<Any> = []

var value:Any?
//read from CIN until user gives you q
while value as? String != "q"
{
    print("Your value: (or q for end of CIN)")
    guard let newValue = readLine() else
    {
        print("Cannot get proper value")
        break
    }
    //save value from command line to variable
    value = newValue
    //if is not q, save into array
    if (value as? String != "q")
    {
        numbers.append(value as Any)
    }
}

print("Original order")
for number in numbers
{
    print(number as! String)
}

swapTwoValues(&numbers)

print("New order")
for number in numbers
{
    print(number as! String)
}
