import Foundation

protocol DetailedViewOutput {
  func viewIsReady()
  func askingForFavButtonStatus(id: Int)
  func askingForInsert(id: Int)
  func askingForDelete(id: Int) 
}
