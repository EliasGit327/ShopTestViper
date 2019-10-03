import Foundation
import UIKit

final class MainInteractor: MainInteractorInput {

  weak var output: MainInteractorOutput!
  
  
  
  func requestArray() {
    print("Alamofire request has been sent")
    
//    output.onArrayBuilt(array: [
//
//      ShopListElement(0, "iPhone Xr Red", #imageLiteral(resourceName: "iphone_xr_red"), "Превосходный представитель новой линейки смартфонов Apple\nНовая версия получила такой же красивый дизайн, как и модель iPhone X\nВот только задняя панель выполнена с огромным вниманием из стекла", "", 790, 5),
//      ShopListElement(1, "iPhone Xr Black", #imageLiteral(resourceName: "iphone_xr_black"), "Превосходный представитель новой линейки смартфонов Apple\nНовая версия получила такой же красивый дизайн, как и модель iPhone X\nВот только задняя панель выполнена с огромным вниманием из стекла", "", 790, 5)
//      ])
    
    AlamofireHelper.shared.getShopArray(offset: 0, limit: 30, onComplete: {[weak self] (items) in
      if let items = items {
     self?.output.onArrayBuilt(array: items)
      } else {
        self?.output.onError(text: "Something went wrong")
      }
    })
  }
  
}
