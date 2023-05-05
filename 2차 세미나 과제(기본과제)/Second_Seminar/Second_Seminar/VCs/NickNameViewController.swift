import UIKit
import SnapKit
import Then



protocol DataBindNickName: AnyObject{
    func dataBindNickName(text: String)
}


class NickNameViewController: UIViewController, UITextFieldDelegate {
    
    
    
    private let noticeNickName = UILabel().then{
        $0.text = "닉네임을 입력해주세요"
        $0.font = .systemFont(ofSize: 23)
    }
    
    private let nickNameText = UITextField().then{
        $0.placeholder = "닉네임을 입력해주세요"
        $0.setPlaceholder(color: .tvingGray5)
        $0.backgroundColor = .tvingGray2
        $0.isEnabled = true
        $0.autocapitalizationType = .none
        $0.textColor = .tvingGray5
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        $0.leftViewMode = .always
        $0.addTarget(self, action: #selector(nickTextFieldDidChange), for: .editingChanged)
        
    }
    
    private let nickNameSaveButton = UIButton().then{
        $0.setTitle("저장하기", for: .normal)
        $0.setTitleColor(.tvingGray2, for: .normal)
        $0.backgroundColor = .white
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.tvingGray2.cgColor
        $0.addTarget(self, action: #selector(saveNickNameButton),
                     for: .touchUpInside)
        $0.isEnabled = false
        
    }
    
    weak var delegate: DataBindNickName?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.detents = [.medium(), .large()]
        }
        setStyle()
        setLayout()
        
        
        nickNameText.delegate = self
        
    }
    
}

private extension NickNameViewController{
    func setStyle() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        [noticeNickName, nickNameText, nickNameSaveButton].forEach{ view.addSubview($0) }
        
        
        noticeNickName.snp.makeConstraints{
            $0.top.equalToSuperview().inset(45)
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalTo(nickNameText.snp.top).offset(-21)
            $0.height.equalTo(27)
            
        }
        
        nickNameText.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        nickNameSaveButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    @objc
    func saveNickNameButton(){
        if nickNameSaveButton.isEnabled {
            self.dismiss(animated: true, completion: nil)
        }
        if let text = nickNameText.text {
            delegate?.dataBindNickName(text: text)
        }
    }
    
    @objc func nickTextFieldDidChange(_ textField: UITextField) {
        // 키보드 업데이트 시 원하는 기능
        if nickNameText.hasText {
            nickNameSaveButton.isEnabled = true
            nickNameSaveButton.setTitleColor(.white, for: .normal)
            nickNameSaveButton.backgroundColor = .tvingRed
            nickNameSaveButton.layer.borderWidth = 2
            nickNameSaveButton.layer.borderColor = UIColor.tvingRed.cgColor
            
        } else {
            nickNameSaveButton.isEnabled = false
            nickNameSaveButton.setTitleColor(.tvingGray2, for: .normal)
            nickNameSaveButton.backgroundColor = .white
            nickNameSaveButton.layer.borderWidth = 2
            nickNameSaveButton.layer.borderColor = UIColor.tvingGray2.cgColor
        }
    }
}
