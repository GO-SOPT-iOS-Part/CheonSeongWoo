import UIKit

import SnapKit
import Then

class MovieTableViewCell: UITableViewCell {

    let movieImage = UIImageView()
    let titleLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
    }
    let releaseLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    let popularityLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(movieImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(releaseLabel)
        contentView.addSubview(popularityLabel)
        
        movieImage.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(7)
        }
        releaseLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(7)
        }
        popularityLabel.snp.makeConstraints{
            $0.top.equalTo(releaseLabel.snp.bottom).offset(4)
            $0.trailing.equalToSuperview().inset(7)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


