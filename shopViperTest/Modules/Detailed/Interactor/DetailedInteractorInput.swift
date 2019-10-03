import Foundation

protocol DetailedInteractorInput {

  func requestIfFav(id: Int)
  
  func requestFavInsert(id: Int)
  func requestFavDelete(id: Int)
}
