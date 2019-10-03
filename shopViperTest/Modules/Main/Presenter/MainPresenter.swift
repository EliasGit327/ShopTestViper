import Foundation

final class MainPresenter {
  
  weak var view: MainViewInput!
  var interactor: MainInteractorInput!
  var router: MainRouterInput!
}


// MARK: - MainViewOutput

extension MainPresenter: MainViewOutput {
  
  func favButtonTapped() {
    router.jumpToFav()
  }
  
  func callDataSource() {
    interactor.requestArray()
  }
  
  func viewIsReady() {
    view.setupInitialState()
  }
  
  func tableCellTapped(element: ShopListElement) {
    router.jumpToDetailed(element: element)
  }
  
}

// MARK: - MainInteractorOutput

extension MainPresenter: MainInteractorOutput {
  func onError(text: String) {
    view.onError(text: text)
  }
  
  func onArrayBuilt(array: [ShopListElement]) {
    view.onGetResponseData(items: array)
  }
  
  
}
