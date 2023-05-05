import UIKit

import SnapKit
import Then

class SettingFooterView: UITableViewHeaderFooterView {
    
    private let separate = UIView().then{
        $0.backgroundColor = .tvingGray4
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.backgroundColor = .black
    }
    
    private func setLayout() {
        self.addSubview(separate)
        separate.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
