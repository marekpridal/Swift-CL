//: Playground - noun: a place where people can play
import Foundation
class Animal
{
    private var name:String
    private var age:Int

    public init()
    {
        self.name = "noName"
        self.age = -1
    }

    public init(jmeno:String,vek:Int)
    {
        self.name=jmeno
        self.age=vek
    }

    public func getDetails() -> String
    {
        return "Zvire se jmenuje "+self.name+" a je stare \(age) let(roků)"
    }
}

class Dog:Animal
{
    private var vaha:Int

    func woof()->String
    {
        return "Haf"
    }

    public override init()
    {
        self.vaha = -1
        super.init()
    }

    public init(jmeno:String,vek:Int,vaha:Int)
    {
        self.vaha = vaha
        super.init(jmeno: jmeno, vek: vek)
    }

    public override func getDetails() -> String
    {
        return super.getDetails()+" a jeho vaha je \(vaha) kg"
    }
}

class Cat:Animal
{
    public func meow()->String
    {
        return "Mnau"
    }
}

var Pes = Dog()
var Kocka = Cat()
var pejsek = Dog(jmeno: "Hafík",vek: 20,vaha: 5)

print(Pes.woof())
print(Pes.getDetails())
print(Kocka.meow())
print(Kocka.getDetails())
print(pejsek.getDetails())
