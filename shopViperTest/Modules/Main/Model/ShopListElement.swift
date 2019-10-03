
import Foundation
import UIKit

class ShopListElement {
  
  var id: Int!
  var name: String!
  var image: UIImage!
  var shortDescription: String!
  var longDescription: String!
  var price: Double!
  var discount: Double!
  
  init(_ id: Int, _ name: String, _ image: UIImage, _ shortDescr: String, _ longDescr: String, _ price: Double, _ discount: Double) {
    self.id = id
    self.name = name
    self.image = image
    self.shortDescription = shortDescr
    self.longDescription = longDescr
    self.price = price
    self.discount = discount
  }
}
