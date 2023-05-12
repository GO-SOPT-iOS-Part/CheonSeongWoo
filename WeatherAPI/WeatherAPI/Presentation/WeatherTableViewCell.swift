import UIKit

import SnapKit
import Then

class WeatherTableViewCell: UITableViewCell {

    let weatherImage = UIImageView()
    let cityLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }
    let tempLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    let humidityLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(weatherImage)
        contentView.addSubview(cityLabel)
        contentView.addSubview(tempLabel)
        contentView.addSubview(humidityLabel)
        
        weatherImage.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        cityLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(7)
        }
        tempLabel.snp.makeConstraints{
            $0.top.equalTo(cityLabel.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(7)
        }
        humidityLabel.snp.makeConstraints{
            $0.top.equalTo(tempLabel.snp.bottom).offset(4)
            $0.trailing.equalToSuperview().inset(7)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
