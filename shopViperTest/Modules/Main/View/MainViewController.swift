import UIKit
import JGProgressHUD

protocol SharedWithTable {
  func onTableCellTap(element: ShopListElement)
  var hud: JGProgressHUD { get }
}

final class MainViewController: UIViewController, StoryboardInstantiable, SharedWithTable {
  
  static var storyboardName: String = "MainViewController"
  var output: MainViewOutput!
  @IBOutlet weak var tableView: UITableView!
  let hud = JGProgressHUD(style: .dark)
  
  public var shopListTVController: ShopListTVController?
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    let configurator = MainModuleConfigurator()
    configurator.configureModule(for: self)
    super.viewDidLoad()
    output.viewIsReady()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
  }
  
  @IBAction func onFavTap(_ sender: Any) {
    output.favButtonTapped()
  }
  
  func onTableCellTap(element: ShopListElement) {
    output.tableCellTapped(element: element)
  }
}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {
  func onError(text: String) {
    print(text)
  }
  
  
  func onGetResponseData(items: [ShopListElement]) {
    shopListTVController?.updateData(array: items)
  }
  
  func setupInitialState() {
    // Making logo in center
    let imageView = UIImageView(image: UIImage(named: "logo.png"))
    imageView.contentMode = .scaleAspectFit
    navigationItem.titleView = imageView
    // Making custom back button
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
    //Defining table controller
    shopListTVController = ShopListTVController(tableView: tableView)
    shopListTVController?.protocolVC = self
    
    
    hud.show(in: self.view)
    output.callDataSource()
    hud.dismiss(afterDelay: 5)
  }
  
}
