import Foundation

protocol MainViewOutput {
  func viewIsReady()
  func callDataSource()
  func favButtonTapped()
  func tableCellTapped(element: ShopListElement)
}
