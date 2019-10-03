
import Foundation
import UIKit

let lightStyle = UIBlurEffect(style: .light)
let customCornerRadius : CGFloat = 8

class BlurredRoundedView: UIView {
  let effectBackground = UIVisualEffectView(effect: lightStyle)
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit()  {
    initLayer()
    initEffectView()
  }
  
  func initLayer() {
    backgroundColor = UIColor.clear
    layer.cornerRadius = customCornerRadius
    layer.masksToBounds = false
  }
  
  func initEffectView() {
    effectBackground.frame = bounds
    effectBackground.layer.cornerRadius = customCornerRadius
    effectBackground.layer.masksToBounds = true
    
    addSubview(effectBackground)
    sendSubviewToBack(effectBackground)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    effectBackground.frame = bounds
    
  }
}
