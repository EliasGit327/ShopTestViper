
import Foundation

class AdapterService {
  
  func getOnlyFavID(favs: [Fav]) -> [Int] {
    var intArray = [Int]()
    for fav in favs {
      intArray.append(fav.id)
    }
    
    return intArray
  }
  
  func getFavFromArray(array: [ShopListElement], favs: [Int]) -> [ShopListElement] {
    var resultArray = [ShopListElement]()
    
    for element in array {
      if favs.contains(element.id) {
        resultArray.append(element)
      }
    }
    
    return resultArray
  }
  
}
