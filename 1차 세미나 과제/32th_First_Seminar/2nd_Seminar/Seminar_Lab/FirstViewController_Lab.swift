import UIKit
import SnapKit
import Then

final class FirstViewController_Lab: UIViewController {
    
    private var numberCount = 0 {
        didSet {
            self.noticeLabel.text = numberCount > 10 ? "10번 이상 눌렀네.. \(numberCount)" : "조금만 더 눌러바.. \(numberCount)"
        }
    }
    
    private let noticeLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.text = "버튼 탭 횟수는 ?!"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 10

        return label
    }()
    
    private lazy var nextButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }
}

private extension FirstViewController_Lab {
    func style(){
        view.backgroundColor = .white
        
        noticeLabel.do{
            $0.layer.cornerRadius = 10
        }
        nextButton.do {
            $0.setTitle("다음으로!", for: .normal)
            $0.backgroundColor = .blue
            $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
            $0.addTarget(self,
                         action: #selector(nextButtonTap),
                         for: .touchUpInside)
            $0.layer.cornerRadius = 10

        }
    }
    func setLayout(){
                view.addSubview(noticeLabel)
                view.addSubview(nextButton)
        
        noticeLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width - 40)
        }
        
        nextButton.snp.makeConstraints{
            $0.top.equalTo(noticeLabel.snp.bottom).offset(10)
            $0.size.equalTo(100)
            $0.centerX.equalToSuperview()
        }
    }
    

    @objc
    func nextButtonTap(){
        let viewController = SecondViewController_Lab()
        viewController.delegate = self
        self.present(viewController, animated: true)
    }
    
}

extension FirstViewController_Lab: TapButton{
    func buttonTapped(count: Int) {
        self.numberCount = count
    }
}
