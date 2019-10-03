
import Foundation
import SwiftyJSON

public class Adapter {
  
  func convertJSONtoArray(json: JSON) -> [ShopListElement] {

    var shopListArray = [ShopListElement]()
    
    for ( _ , jsonElement) in json {
      let id: Int = jsonElement["id"].intValue
      let title: String = jsonElement["title"].stringValue
      let price: Double = jsonElement["price"].doubleValue
      let discount: Double = jsonElement["sale_precent"].doubleValue
      let shortDescr: String = jsonElement["short_description"].stringValue
      let longDescr: String = jsonElement["details"].stringValue
      let urlOfImg: String = jsonElement["image"].stringValue
      
      var image: UIImage?
      let url = URL(string: urlOfImg)
      let data = try? Data(contentsOf: url!)
      if(data != nil){
        image = UIImage(data: data!)!
      }
      
      shopListArray.append(ShopListElement(id, title, image!, shortDescr, longDescr, price, discount))
    }
    
    return shopListArray
  }
}
