import UIKit
extension NSMutableAttributedString {
    
    func attributeString(string: String, font: UIFont?, textColor: UIColor, lineSpace: CGFloat? = nil, isCenter: Bool = false) -> NSMutableAttributedString {
        var attributes: [NSAttributedString.Key: Any] = [
            .font: font ?? UIFont.boldSystemFont(ofSize: 16),
            .foregroundColor: textColor
        ]
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        // 텍스트 line 간의 height 설정
        if let lineSpace = lineSpace {
            paragraphStyle.lineSpacing = lineSpace
        }
        
        // 텍스트의 가운데 정렬
        if isCenter {
            paragraphStyle.alignment = .center
        }

        attributes[.paragraphStyle] = paragraphStyle

        self.append(NSAttributedString(string: string, attributes: attributes))
        
        return self
    }
}

extension UITableViewHeaderFooterView{
    static var cellIdentifier  : String {
        return String(describing: self)
    }
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
