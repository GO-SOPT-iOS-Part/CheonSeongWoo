
import UIKit
import SnapKit
import Then
class TVingMainViewController: BaseViewController {

    private var hihi = UILabel().then{
        $0.text = "TVing 메인화면입니다"
        $0.textColor = .white
    }
    private lazy var goToProfileButton = UIButton().then {
        $0.setImage(UIImage(named: "swift-playgrounds_icon"), for: .normal)
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.view.addSubview(hihi)
        self.view.addSubview(goToProfileButton)
        
        hihi.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-50)
        }
        
        goToProfileButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(hihi.snp.bottom).offset(20)
        }
    }
    
    @objc
    func goToProfile(){
        let mypageVC = MyPageViewController()
        self.navigationController?.pushViewController(mypageVC, animated: true)
        print("!?")
    }
}
