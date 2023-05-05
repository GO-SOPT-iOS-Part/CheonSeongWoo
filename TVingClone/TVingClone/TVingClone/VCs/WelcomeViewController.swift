import UIKit
import SnapKit
import Then



class WelcomeViewController: UIViewController {
    private let email: String? = nil
    
    private let tvingLogo = UIImageView().then{
        $0.image = UIImage(named: "TLogo")
    }
    
    private let welcomeLabel = UILabel().then{
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 23)
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.text = "Test님\n반가워요!"
    }
    
    private lazy var dismissButton = UIButton().then{
        $0.setTitle("메인으로", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.backgroundColor = .tvingRed
        $0.addTarget(self,
                     action: #selector(mainButtonTap),
                     for: .touchUpInside)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}

extension WelcomeViewController{
    func setStyle() {
        view.backgroundColor = .black
    }
    
    func loginDataBind(email: String){
        welcomeLabel.text = "\(email) 님\n반가워요!"
    }
    
    func setLayout() {
        [tvingLogo, welcomeLabel, dismissButton].forEach{ view.addSubview($0) }
        
        
        tvingLogo.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(58)
            $0.height.equalTo(210)
        }
        
        welcomeLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(tvingLogo.snp.bottom).offset(67)
        }
        
        dismissButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
    }
    
    @objc
    func mainButtonTap(){
        let mainVC = TVingMainViewController() // 이동할 ViewController를 초기화합니다.
        let navVC = UINavigationController(rootViewController: mainVC) // UINavigationController를 생성하고 rootViewController로 mainVC를 설정합니다.
        navVC.modalPresentationStyle = .fullScreen // fullScreen 모드로 설정합니다.
        self.present(navVC, animated: true) // 현재 ViewController에서 네비게이션 컨트롤러를 present합니다.
    }

}
