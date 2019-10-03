import Foundation

protocol DetailedViewInput: class {
	func setupInitialState()
  func presentIfFav(status: Bool)
}
