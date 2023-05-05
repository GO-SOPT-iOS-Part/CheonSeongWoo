import UIKit
import SnapKit
import Then

final class MyPageHeaderView: UITableViewHeaderFooterView {
    
    lazy var backButton = UIButton().then {
        if let image = UIImage(named: "Back"){
              let resizedImage = image.resize(to: CGSize(width: 8, height: 15))
              $0.setImage(resizedImage, for: .normal)
          }
    }
    
    private lazy var notificationButton = UIButton().then {
        if let image = UIImage(named: "notice")?.withTintColor(.gray, renderingMode: .alwaysOriginal) {
                let resizedImage = image.resize(to: CGSize(width: 20, height: 25))
                $0.setImage(resizedImage, for: .normal)
                $0.tintColor = UIColor.tvingGray3 //원하는 틴트컬러로 설정
            }
    }
    
    private lazy var settingButton = UIButton().then {
        if let image = UIImage(named: "setting")?.withTintColor(.gray, renderingMode: .alwaysOriginal) {
                  let resizedImage = image.resize(to: CGSize(width: 30, height: 30))
                  $0.setImage(resizedImage, for: .normal)
                  $0.tintColor = UIColor.tvingGray3 //원하는 틴트컬러로 설정
              }
    }
    
    private let profileImage = UIImageView().then {
        $0.image = UIImage(named: "swift-playgrounds_icon")
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "천상구"
        $0.font = .systemFont(ofSize: 17)
        $0.textColor = .white
    }
    
    private lazy var changeButton = UIButton().then {
        $0.setTitle("프로필 전환", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.tvingGray4.cgColor
        $0.layer.cornerRadius = 2
        $0.contentEdgeInsets = UIEdgeInsets(top: 7, left: 11, bottom: 7, right: 11)
    }
    
    private let ticketView = UIView().then {
        $0.backgroundColor = .tvingGray5
        $0.layer.cornerRadius = 3
    }
    
    private lazy var ticketStack = UIStackView().then{
        $0.axis = .horizontal
    }
    
    private var ticketImage = UIImageView().then{
        $0.image = UIImage(named: "ticket")?.resize(to: CGSize(width: 23, height: 23))
    }
    
    private var myTicketLabel = UILabel().then{
        $0.text = "나의 이용권"
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .tvingGray3
    }
    
    private var ticakeCountLabel = UILabel().then{
        $0.text = "사용중인 이용권이 없습니다"
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .tvingGray3
    }
    
    private lazy var cashStack = UIStackView().then{
        $0.axis = .horizontal
    }
    
    private var cashImage = UIImageView().then{
        $0.image = UIImage(named: "cash")?.resize(to: CGSize(width: 23, height: 23))
    }
    
    private var cashLabel = UILabel().then{
        $0.text = "티빙캐시"
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .tvingGray3
    }
    
    private var cashCountLabel = UILabel().then(){
        $0.text = "0"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 15)
    }
    

    
    private let tvProgramView = UIView().then {
        $0.backgroundColor = .tvingGray5
        $0.layer.cornerRadius = 3
    }
    
    private let tvProgramLabel: UILabel = {
        let label = UILabel()
        let programImage = NSTextAttachment(image: UIImage(named:"tvN_jtbc_Logo")!)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: "이용권을 구매하고 "))
        attributedString.append(NSAttributedString(attachment: programImage))
        attributedString.append(NSAttributedString(string: " 등 인기 프로그램과\n다양한 영화 콘텐츠를 자유롭게 시청하세요!"))
        label.numberOfLines = 2
        label.attributedText = attributedString
        label.textColor = .tvingGray2
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private let nextButton = UIButton().then {
        if let image = UIImage(named: "Mark")?.withTintColor(.gray, renderingMode: .alwaysOriginal) {
            let resizedImage = image.resize(to: CGSize(width: 18, height: 16))
            $0.setImage(resizedImage, for: .normal)
            $0.tintColor = UIColor.tvingGray2 //원하는 틴트컬러로 설정
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        awakeFromNib()
        setStack()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setStack(){
        ticketStack.addArrangedSubview(ticketImage)
        ticketStack.setCustomSpacing(10, after: ticketImage)
        ticketStack.addArrangedSubview(myTicketLabel)
        ticketStack.setCustomSpacing(78, after: myTicketLabel)
        ticketStack.addArrangedSubview(ticakeCountLabel)
        
        cashStack.addArrangedSubview(cashImage)
        cashStack.setCustomSpacing(10, after: cashImage)
        cashStack.addArrangedSubview(cashLabel)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    private func setLayout() {
        [
            backButton,
            notificationButton,
            settingButton,
            profileImage,
            nameLabel,
            changeButton,
            ticketView,
            ticketStack,
            cashStack,
            cashCountLabel,
            tvProgramView
        ].forEach{ addSubview($0) }
        
      
        
        tvProgramView.addSubviews(
            tvProgramLabel,
            nextButton
        )
        
        backButton.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(24)
            $0.top.equalToSuperview().offset(10)
        }
        
        notificationButton.snp.makeConstraints{
            $0.top.equalTo(backButton).inset(3)
            $0.trailing.equalToSuperview().inset(67)
        }
        
        settingButton.snp.makeConstraints{
            $0.top.equalTo(backButton)
            $0.trailing.equalToSuperview().inset(25)
        }
        
        profileImage.snp.makeConstraints{
            $0.top.equalTo(backButton.snp.bottom).offset(35)
            $0.leading.equalToSuperview().offset(24)
            $0.width.height.equalTo(74)
        }
        
        nameLabel.snp.makeConstraints{
            $0.centerY.equalTo(profileImage)
            $0.leading.equalTo(profileImage.snp.trailing).offset(22)
        }
        
        changeButton.snp.makeConstraints{
            $0.centerY.equalTo(nameLabel)
            $0.trailing.equalToSuperview().inset(23)
        }
        
        ticketView.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.bottom).offset(30)
            $0.height.equalTo(92)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
    
        ticketStack.snp.makeConstraints{
            $0.top.equalTo(ticketView).offset(18)
            $0.leading.equalTo(ticketView).offset(25)
        }

        cashStack.snp.makeConstraints{
            $0.top.equalTo(ticketView).offset(58)
            $0.leading.equalTo(ticketView).offset(25)
        }

        cashCountLabel.snp.makeConstraints{
            $0.top.equalTo(ticketView).offset(58)
            $0.trailing.equalTo(ticketView).offset(-15)
        }
        
    
        tvProgramView.snp.makeConstraints{
            $0.top.equalTo(ticketView.snp.bottom).offset(12)
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        tvProgramLabel.snp.makeConstraints{
            $0.centerY.equalTo(tvProgramView)
            $0.leading.equalToSuperview().offset(18)
        }
        
        nextButton.snp.makeConstraints{
            $0.centerY.equalTo(tvProgramView)
            $0.trailing.equalToSuperview().inset(13)
        }
    }
    
    
}
