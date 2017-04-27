//
//  car.swift
//  packageDemo
//
//  Created by Marek Pridal on 24.04.17.
//
//

import Foundation

class Car
{
    let name:String
    let color:String
    
    init()
    {
        self.name = "No name"
        self.color = "No color"
    }
    
    init(name:String, color:String)
    {
        self.name = name
        self.color = color
    }
    
    public func printClass()
    {
        print("Name = \(self.name) color = \(self.color)")
    }
}
