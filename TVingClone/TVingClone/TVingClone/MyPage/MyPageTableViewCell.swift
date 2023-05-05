import UIKit

import SnapKit
import Then

final class MyPageTableViewCell: UITableViewCell {
    static let identifier = "MyPageTableViewCell"

    private let titleLabel = UILabel().then {
        $0.textColor = .tvingGray2
        $0.font = .systemFont(ofSize: 15)
    }

    private lazy var nextImage = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setStyle()
        setLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setStyle() {
        self.backgroundColor = .black
        separatorInset.left = 0
        selectionStyle = .none
    }

    func setLayout() {
        [titleLabel, nextImage].forEach{contentView.addSubview($0)}

        titleLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
        }
        nextImage.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
    }

    func configureCell(_ myPage: myPage) {
        titleLabel.text = myPage.title
        nextImage.image = myPage.image
    }
}
