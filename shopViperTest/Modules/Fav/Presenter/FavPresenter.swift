import Foundation

final class FavPresenter {

    weak var view: FavViewInput!
    var interactor: FavInteractorInput!
    var router: FavRouterInput!
}


// MARK: - FavViewOutput

extension FavPresenter: FavViewOutput {
  
  func requestFavTableData() {
    interactor.askForFavTableData()
  }
  
  func tableCellTapped(element: ShopListElement) {
    router.jumpToDetailed(element: element)
  }
  
	func viewIsReady() {
		view.setupInitialState()
    }
}

// MARK: - FavInteractorOutput

extension FavPresenter: FavInteractorOutput {
  func returnFavData(data: [ShopListElement]) {
    view.returnFavData(data: data)
  }
  
	
}
