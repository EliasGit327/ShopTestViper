import UIKit
import JGProgressHUD

protocol FavSharedWithTable {
  func onTableCellTap(element: ShopListElement)
  var hud: JGProgressHUD? { get }
}

final class FavViewController: UIViewController, StoryboardInstantiable, FavSharedWithTable {
  
  func onTableCellTap(element: ShopListElement) {
    output.tableCellTapped(element: element)
  }
  
  var hud: JGProgressHUD?
  
  static var storyboardName: String = "FavViewController"
  var output: FavViewOutput!
  
  var favTableViewController: FavShopListTVController?
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    let configurator = FavModuleConfigurator()
    configurator.configureModule(for: self)
    super.viewDidLoad()
    output.viewIsReady()
  }
}

// MARK: - FavViewInput

extension FavViewController: FavViewInput {
  
  func returnFavData(data: [ShopListElement]) {
    favTableViewController?.updateData(array: data)
    hud?.dismiss()
  }
  
  func setupInitialState() {
    // Making logo in center
    let imageView = UIImageView(image: UIImage(named: "logo.png"))
    imageView.contentMode = .scaleAspectFit
    navigationItem.titleView = imageView
    //
    self.hud = JGProgressHUD(style: .dark)
    
    favTableViewController = FavShopListTVController(tableView: tableView)
    favTableViewController?.protocolVC = self
    output.requestFavTableData()
    hud?.show(in: self.view)
    hud?.dismiss(afterDelay: 5)
    
  }
    

}
