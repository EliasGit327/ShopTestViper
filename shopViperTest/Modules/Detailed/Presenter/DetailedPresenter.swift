import Foundation

final class DetailedPresenter {
  
  weak var view: DetailedViewInput!
  var interactor: DetailedInteractorInput!
  var router: DetailedRouterInput!
}


// MARK: - DetailedViewOutput

extension DetailedPresenter: DetailedViewOutput {
  
  func askingForDelete(id: Int) {
    interactor.requestFavDelete(id: id)
  }
  
  
  func askingForInsert(id: Int) {
    interactor.requestFavInsert(id: id)
  }
  
  func askingForFavButtonStatus(id: Int) {
    interactor.requestIfFav(id: id)
  }
  
  func viewIsReady() {
    view.setupInitialState()
  }
}

// MARK: - DetailedInteractorOutput

extension DetailedPresenter: DetailedInteractorOutput {
  func returnIfFavResult(status: Bool) {
    view.presentIfFav(status: status)
  }

}
