import Foundation

var cislo:Int?
print("Zadej cislo")
if let retez = readLine(strippingNewline: true)
{
  cislo = Int(retez)
}

if cislo != nil
{
  var i = 2
  while i < cislo!
  {
      if((cislo!)%i == 0)
      {
          print("Neni prvocislo\nDelitelne cislem \(i)")
          break
      }
      i += 1
      if(i == cislo!)
      {
          print("Cislo je prvocislo")
      }
  }
}else
{
  print("Chyba při načítání čísla")
}
