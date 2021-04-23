import UIKit

@IBDesignable
class BoardButton: UIButton {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setState(playerImage: UIImage) {
        setImage(playerImage, for: .normal)
        isUserInteractionEnabled = false
    }
    
    func reset() {
        isUserInteractionEnabled = true
        setImage(nil, for: .normal)
    }
    
    override func setImage(_ image: UIImage?, for state: UIControl.State) {
        let newImage = image?.withRenderingMode(.alwaysOriginal)
        super.setImage(newImage, for: state)
    }
}
