import Foundation

protocol FavViewInput: class {
	func setupInitialState()
  func returnFavData(data: [ShopListElement])
}
