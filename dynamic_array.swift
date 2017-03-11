/*-----------------------------Imports----------------------------------------*/
import Foundation
/*-----------------------------Functions--------------------------------------*/
func main()
{
  var array: [Int] = []

  print("Write your numbers")

  while let input = readLine()
  {
    if let number = Int(input)
    {
      array.append(number)
    }
  }
  printArray(array)
  array = twoTimes(for:array)
  printArray(array)
}
func printArray(_ array:[Int])
{
  for element in array
  {
    print(element)
  }
}
func twoTimes(for array: [Int])->[Int]
{
  var newArray: [Int] = []
  for element in array
  {
    newArray.append(element*element)
  }
  return newArray
}
/*-----------------------------------MAIN------------------------------------*/
main()
/*---------------------------------------------------------------------------*/
