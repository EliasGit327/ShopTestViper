import Foundation

protocol FavViewOutput {
  func viewIsReady()
  func tableCellTapped(element: ShopListElement)
  func requestFavTableData()
}
