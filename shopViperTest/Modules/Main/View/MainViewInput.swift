import Foundation

protocol MainViewInput: class {
	func setupInitialState()
  func onGetResponseData(items: [ShopListElement])
  func onError(text: String)
}
