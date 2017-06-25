//
//  main.swift
//  LinkedList
//
//  Created by Marek Pridal on 25.06.17.
//  Copyright © 2017 Marek Pridal. All rights reserved.
//

import Foundation

class ElementNotFound : Error
{
    var message:String
    init(_ message:String)
    {
        self.message = message
    }
}

class Node : Equatable
{
    static func ==(lhs: Node, rhs: Node) -> Bool
    {
        return lhs.next == rhs.next && lhs.value == rhs.value
    }
    
    var next:Node? = nil
    var value:String
    init(value:String)
    {
        self.value = value
    }
}

class LinkedList
{
    private var head:Node?
    private var tail:Node?
    
    func push(value:String)
    {
        guard let tail = tail else
        {
            let new = Node(value:value)
            self.head = new
            self.tail = new
            return
        }
        let tmpNode = Node(value:value)
        tail.next = tmpNode
        self.tail = tmpNode
    }
    
    func pop()
    {
        var current = head
        
        while(current?.next?.next != nil)
        {
            current = current?.next
        }
        
        current?.next = nil
        tail = current
    }
    
    func remove() throws
    {
        if head == nil || tail == nil
        {
            throw ElementNotFound("List is already empty")
        }
        head = nil
        tail = nil
    }
    
    func remove(At element:Int) throws
    {
        var current = head
        var increment = 1
        while(current != nil)
        {
            if increment == element - 1
            {
                if (current?.next == tail)
                {
                    tail = current
                }
                
                if (current?.next == nil)
                {
                    throw ElementNotFound("Element not found")
                }
                current?.next = current?.next?.next
                return
            }
            current = current?.next
            increment += 1
        }
        throw ElementNotFound("Element not found")
    }
    
    func debug()
    {
        var current = head
        var increment = 1
        while(current != nil)
        {
            print(increment)
            print(current!.value)
            current = current?.next
            increment += 1
        }
    }
}

var list = LinkedList()

list.push(value: "first")
list.push(value: "second")
list.push(value: "third")
//list.debug()
list.pop()
//list.debug()
list.push(value: "fourth")
list.push(value: "fifth")

do
{
    list.debug()
    try list.remove(At: 4)
    list.debug()
    try list.remove(At: 3)
    list.debug()
    try list.remove(At: 3)
    list.debug()
}catch
{
    print("Error")
}
do
{
    try list.remove()
    list.debug()
    try list.remove()
}catch
{
    print("Error")
}
