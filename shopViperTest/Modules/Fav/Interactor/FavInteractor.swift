import Foundation

final class FavInteractor: FavInteractorInput {
  
  func askForFavTableData() {
    let favArray = RealmService.shared.getFavArray()
    let adapter = AdapterService()
    let intFavArray = adapter.getOnlyFavID(favs: favArray)
    
    AlamofireHelper.shared.getShopArray(offset: 0, limit: 100) { (elements) in
      let result = adapter.getFavFromArray(array: elements!, favs: intFavArray)
      self.output.returnFavData(data: result)
    }
  }

    weak var output: FavInteractorOutput!

}
