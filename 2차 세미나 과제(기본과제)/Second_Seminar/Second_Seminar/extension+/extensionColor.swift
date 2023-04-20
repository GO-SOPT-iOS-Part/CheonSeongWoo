import UIKit

extension UIColor {

    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}

extension UIColor {

    class var tvingRed: UIColor {
        return UIColor(r: 255, g: 20, b: 60)
    }

    class var tvingGray4: UIColor {
        return UIColor(r: 214, g: 214, b: 214)
    }

    class var tvingGray3: UIColor {
        return UIColor(r: 156, g: 156, b: 156)
    }

    class var tvingGray2: UIColor {
        return UIColor(r: 98, g: 98, b: 98)
    }

    class var tvingGray1: UIColor {
        return UIColor(r: 46, g: 46, b: 46)
    }
}

extension UITextField {
    func setPlaceholder(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
}
