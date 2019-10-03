//
//  ShopListTVCell.swift
//  shopViperTest
//
//  Created by Elias on 25/07/2019.
//  Copyright © 2019 Elias. All rights reserved.
//

import UIKit

class FavShopListTVCell: UITableViewCell {
  
  @IBOutlet weak var imageOfItem: UIImageView!
  @IBOutlet weak var titleOfItem: UILabel!
  @IBOutlet weak var descriptionOfItem: UILabel!
  @IBOutlet weak var priceOfItem: UILabel!
  @IBOutlet weak var oldPriceOfItem: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.selectionStyle = .none
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
}
