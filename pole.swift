import Foundation

func obracene(_ retez:String)->String
{
    var rev = retez+" <-> "
    //pomocí funkce
    //rev += String(retez.characters.reversed())

    var pocet = (retez.characters.count)
    //print(pocet)
    //maunálně přes pole
    while pocet != 0
    {
      let index = retez.index(retez.startIndex, offsetBy: (pocet-1))
      print(retez[index])
      rev += String(retez[index])
      //print(pocet)
      pocet = pocet - 1
    }
    //návratová hodnota funkce
    return rev
}


print("Zadej string")
if let response = readLine(strippingNewline: true)
{
  print("Tvuj string = "+response)
  print(obracene(response))
}else
{
  print("Zadal si špatný string")
}
