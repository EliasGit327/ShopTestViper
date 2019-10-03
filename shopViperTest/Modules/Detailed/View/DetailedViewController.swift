import UIKit

final class DetailedViewController: UIViewController, StoryboardInstantiable {
  
  var item: ShopListElement?
  
  @IBOutlet weak var favButton: UIButton!
  @IBOutlet weak var imageOfItem: UIImageView!
  @IBOutlet weak var titleOfItem: UILabel!
  @IBOutlet weak var descriptionOfItem: UILabel!
  @IBOutlet weak var priceOfItem: UILabel!
  @IBOutlet weak var oldPriceOfItem: UIView!
  @IBOutlet weak var fullDescriptionOfItem: UITextView!
  @IBOutlet weak var bottomView: UIView!
  
  var isFav = false
  static var storyboardName: String = "DetailedViewController"
  var output: DetailedViewOutput!
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    let configurator = DetailedModuleConfigurator()
    configurator.configureModule(for: self)
    super.viewDidLoad()
    output.viewIsReady()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    imageOfItem.image = item?.image
    titleOfItem.text = item?.name!
    descriptionOfItem.text = item?.shortDescription!
    let price = String(format: "%.2f", (item?.price!)!)
    priceOfItem.text = "$ \(price)"
    fullDescriptionOfItem.text = item?.longDescription
    
    output.askingForFavButtonStatus(id: item!.id)
  }
  
  @IBAction func onFavTap(_ sender: Any) {
    if(!isFav) {
      isFav = true
      favButton.setImage(#imageLiteral(resourceName: "fav"), for: .normal)
      output.askingForInsert(id: item!.id)
    } else {
      isFav = false
      favButton.setImage(#imageLiteral(resourceName: "fav_empty"), for: .normal)
      output.askingForDelete(id: item!.id)
    }
  }
  
}

// MARK: - DetailedViewInput

extension DetailedViewController: DetailedViewInput {
  
  func presentIfFav(status: Bool) {
    if(status) {
      isFav = true
      favButton.setImage(#imageLiteral(resourceName: "fav"), for: .normal)
    }
  }
  
  
  func setupInitialState() {
    let imageView = UIImageView(image: UIImage(named: "logo.png"))
    imageView.contentMode = .scaleAspectFit
    navigationItem.titleView = imageView
    
    bottomView.layer.shadowColor = UIColor.gray.cgColor
    bottomView.layer.shadowOpacity = 0.5
    bottomView.layer.shadowOffset = CGSize(width: 2, height: 2)
    bottomView.layer.shadowRadius = 6
  }

  
  
}
