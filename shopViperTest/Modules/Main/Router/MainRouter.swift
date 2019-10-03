import Foundation

final class MainRouter: MainRouterInput {
  
  func jumpToFav() {
    let favVC = FavViewController.instantiate()
    viewController.navigationController?.pushViewController(favVC, animated: true)
  }
  
  func jumpToDetailed(element: ShopListElement) {
    let favVC = DetailedViewController.instantiate()
    favVC.item = element
    viewController.navigationController?.pushViewController(favVC, animated: true)
  }
  
	var viewController: MainViewController!
}
