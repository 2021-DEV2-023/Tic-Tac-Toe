import UIKit

extension PlayersType {
    func getImage() -> UIImage {
        switch self {
        case .circle:
            return UIImage.circle
        case .cross:
            return UIImage.cross
        }
    }
}
