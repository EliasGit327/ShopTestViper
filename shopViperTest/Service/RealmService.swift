
import Foundation
import RealmSwift
import Realm

class RealmService {
  private init(){}
  static let shared = RealmService()
  
  let realm = try! Realm()
  
  func insertFav(id: Int) {
    let fav = Fav()
    fav.id = id
    
    try! realm.write {
      realm.add(fav)
    }
  }
  
  func deleteFav(id: Int) {
    
    let result =  realm.objects(Fav.self).filter("id = \(id)")
    
    try! realm.write {
      realm.delete(result)
    }
  }
  
  func checkIfContains(id: Int) -> Bool {
    
    let result = realm.objects(Fav.self)
    var array = [Int]()
    for resultItem in result.map({$0}) {
      array.append(resultItem.id)
    }
    return array.contains(id)
  }
  
  func getFavArray() -> [Fav] {
    let result = realm.objects(Fav.self)
    return result.map({$0})
  }
  

  
}
