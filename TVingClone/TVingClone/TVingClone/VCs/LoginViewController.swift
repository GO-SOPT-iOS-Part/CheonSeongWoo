import UIKit
import SnapKit
import Then


final class LoginViewController: UIViewController {
        
    var nickName: String?
    
    private let noticeLabel = UILabel().then{
        $0.text = "TVING ID 로그인"
        $0.font = .systemFont(ofSize: 23)
        $0.textColor = UIColor.tvingGray1
        $0.textAlignment = .center
    }
    
    private let idText = CustomTextField("아이디").then{
        $0.setSecureButtonHidden(true) // secureButton을 숨김
    }
    private var passwordText = CustomTextField("비밀번호").then {
        $0.isSecureTextEntry = true
    }
    private lazy var loginButton = UIButton().then{
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(.tvingGray2, for: .normal)
        $0.backgroundColor = .black
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.tvingGray4.cgColor
        $0.addTarget(self, action: #selector(presentLoginButton),
                     for: .touchUpInside)
        $0.isEnabled = false
    }
    
    
    private var findIdButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(.tvingGray2, for: .normal)
        
        return button
    }()
    
    private var findPwButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.setTitleColor(.tvingGray2, for: .normal)
        return button
    }()
    
    private var wall: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.textColor = .gray
        return label
    }()
    
    private lazy var loginStackView = UIStackView().then{
        $0.spacing = 30
        $0.axis = .horizontal
    }
    
    private let askLabel = UILabel().then{
        $0.text = "아직 계정이 없으신가요?"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .tvingGray3 // 이거는 UI 다 해결하면 수정할 예정!
        $0.textAlignment = .center
    }
    
    private lazy var nickNameButton = UIButton().then{
        $0.setTitle("닉네임 만들러가기", for: .normal)
        $0.setTitleColor(.tvingGray2, for: .normal)
        $0.setUnderlineTitle("닉네임 만들러가기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.addTarget(self, action: #selector(showNickNameViewController), for: .touchUpInside)

        
    }
    
    
    private lazy var signUpStack = UIStackView().then{
        $0.spacing = 30
        $0.axis = .horizontal
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        setStack()
        
    }
}

private extension LoginViewController {
    
    func setStyle() {
        view.backgroundColor = .black
    }
    
    func setStack() {
        loginStackView.addArrangedSubview(findIdButton)
        loginStackView.addArrangedSubview(wall)
        loginStackView.addArrangedSubview(findPwButton)
        
        signUpStack.addArrangedSubview(askLabel)
        signUpStack.addArrangedSubview(nickNameButton)
        

        idText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        let loginUser = LoginUser()
        let idTextHasText = !(idText.text?.isEmpty ?? true)
        let passwordTextHasText = !(passwordText.text?.isEmpty ?? true)
        
        // 입력된 텍스트에 따라 loginButton의 활성화/비활성화를 업데이트합니다.
        if idTextHasText && passwordTextHasText &&
           loginUser.checkId(email: idText.text ?? "") &&
           loginUser.checkPassword(password: passwordText.text ?? "") {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .tvingRed
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.layer.borderColor = UIColor.tvingRed.cgColor

        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .black
            loginButton.layer.borderColor = UIColor.tvingGray4.cgColor

        }
    }
    
    
    
    func setLayout() {
        [noticeLabel, idText, passwordText, loginButton, loginStackView, signUpStack].forEach{ view.addSubview($0) }
        
        
        noticeLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(90)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
            $0.bottom.equalTo(idText.snp.top).offset(-31)
            $0.leading.trailing.equalToSuperview().inset(20)
            
        }
        
        idText.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(passwordText.snp.top).offset(-7)
            $0.height.equalTo(52)
        }
        passwordText.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(loginButton.snp.top).offset(-20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(loginStackView.snp.top).offset(-20)
            $0.height.equalTo(52)
        }
        loginStackView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(signUpStack.snp.top).offset(-20)
        }
        signUpStack.snp.makeConstraints{
            $0.centerX.equalToSuperview()
        }
    }
    
    func loginButtonTap() {
        let viewController = WelcomeViewController()

        if ((nickName?.isEmpty) != nil) {
            guard let name = self.nickName else { return }
            viewController.loginDataBind(email: name)
            print("\(name)!")
        }
        else{
            guard let email = idText.text else { return }
            viewController.loginDataBind(email: email)
            print("\(email)!")
            print(nickName)
        }
        self.present(viewController, animated: true)
    }
    
    
    
    @objc
    func presentLoginButton() {
        loginButtonTap()
    }
    
    @objc private func showNickNameViewController() {
        let bottomsheetviewcontroller = BottomSheetViewController() // NickNameViewController 인스턴스 생성
        bottomsheetviewcontroller.delegate = self
        self.present(bottomsheetviewcontroller, animated: true, completion: nil) // 모달 형식으로 띄워주기
    }
}

extension LoginViewController: DataBindNickName{
    func dataBindNickName(text: String) {
          self.nickName = text
      }

        
}

