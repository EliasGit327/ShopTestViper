import Foundation

protocol MainInteractorOutput: class {
  
  func onArrayBuilt(array: [ShopListElement])
  func onError(text: String)
}
