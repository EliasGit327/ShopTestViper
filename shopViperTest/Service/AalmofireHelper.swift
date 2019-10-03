
import Foundation
import Alamofire
import SwiftyJSON

class AlamofireHelper {
  
  private init() {}
  public static let shared = AlamofireHelper()
  
  func getShopArray(offset: Int, limit: Int, onComplete: @escaping ( ([ShopListElement]?) -> Void)   ) {
    let parameters = "?offset=\(offset)&limit=\(limit)"
    let urlStr = "http://185.181.231.32:5000/products"+parameters

    Alamofire.request(urlStr).responseJSON { (responseData) -> Void in
      if((responseData.result.value) != nil) {
        let swiftyJsonVar = JSON(responseData.result.value!)
        let adapter = Adapter()
        let result = adapter.convertJSONtoArray(json: swiftyJsonVar)
        onComplete(result)
      } else {
        onComplete(nil)
      }
    }

  }
  
}
