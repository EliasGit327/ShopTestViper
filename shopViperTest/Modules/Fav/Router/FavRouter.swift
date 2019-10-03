import Foundation

final class FavRouter: FavRouterInput {
	var viewController: FavViewController!
  
  func jumpToDetailed(element: ShopListElement) {
    let favVC = DetailedViewController.instantiate()
    favVC.item = element
    viewController.navigationController?.pushViewController(favVC, animated: true)
  }
}
