import Foundation

final class DetailedInteractor: DetailedInteractorInput {
  
  weak var output: DetailedInteractorOutput!
  
  func requestFavDelete(id: Int) {
    RealmService.shared.deleteFav(id: id)
  }

  func requestFavInsert(id: Int) {
    RealmService.shared.insertFav(id: id)
  }
  
  func requestIfFav(id: Int) {
    output.returnIfFavResult(status: RealmService.shared.checkIfContains(id: id) )
  }
  
}
