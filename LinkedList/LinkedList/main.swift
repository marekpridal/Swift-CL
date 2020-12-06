//
//  main.swift
//  LinkedList
//
//  Created by Marek Pridal on 25.06.17.
//  Copyright © 2017 Marek Pridal. All rights reserved.
//

import Foundation

class ElementNotFound: Error {
    var message: String
    init(_ message: String) {
        self.message = message
    }
}

class Node<T>: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.next == rhs.next
    }

    var next: Node?
    var value: T
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?

    func push(value: T) {
        guard let tail = tail else {
            let new = Node<T>(value: value)
            self.head = new
            self.tail = new
            return
        }
        let tmpNode = Node<T>(value: value)
        tail.next = tmpNode
        self.tail = tmpNode
    }

    func pop() {
        var current = head

        while current?.next?.next != nil {
            current = current?.next
        }

        current?.next = nil
        tail = current
    }

    func remove() throws {
        if head == nil || tail == nil {
            throw ElementNotFound("List is already empty")
        }
        head = nil
        tail = nil
    }

    func remove(At element: Int) throws {
        var current = head
        var increment = 1
        while current != nil {
            if increment == element - 1 {
                if current?.next == tail {
                    tail = current
                }

                if current?.next == nil {
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
    
    func reverse() {
        var previousNode: Node<T>? = nil
        var currentNode = head
        var nextNode = head?.next
        while nextNode != nil {
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextNode
            nextNode = currentNode?.next
        }
        currentNode?.next = previousNode
        head = currentNode
    }

    func debug() {
        var current = head
        var increment = 1
        while current != nil {
            print("\(increment) \(current!.value)")
            current = current?.next
            increment += 1
        }
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = self.head

        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
}

var list = LinkedList<Int>()

list.push(value: 100)
list.push(value: 200)
list.push(value: 300)
print(list)

list.reverse()
print(list)
list.reverse()

list.pop()
print(list)
list.push(value: 400)
list.push(value: 500)

do {
    print(list)
    try list.remove(At: 2)
    print(list)
    try list.remove(At: 3)
    print(list)
    try list.remove(At: 3)
    print(list)
} catch {
    print(error.localizedDescription)
}
do {
    try list.remove()
    print(list)
    try list.remove()
} catch {
    print(error.localizedDescription)
}

var listWithString = LinkedList<String>()

listWithString.push(value: "First")
listWithString.push(value: "Second")
listWithString.push(value: "Third")
print(listWithString)
listWithString.pop()
print(listWithString)
listWithString.push(value: "Fourth")
listWithString.push(value: "Fifth")

do {
    print(listWithString)
    try listWithString.remove(At: 2)
    print(listWithString)
    try listWithString.remove(At: 3)
    print(listWithString)
    try listWithString.remove(At: 3)
    print(listWithString)
} catch {
    print(error.localizedDescription)
}
do {
    try listWithString.remove()
    print(listWithString)
    try listWithString.remove()
} catch {
    print(error.localizedDescription)
}
