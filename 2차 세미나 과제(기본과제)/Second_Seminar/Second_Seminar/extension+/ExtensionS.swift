import UIKit
import Then


extension UIButton {
    func setUnderlineTitle(_ title: String?, for state: UIControl.State) {
        guard let title = title else { return }
        let attributedString = NSAttributedString(string: title, attributes: [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.foregroundColor: self.titleColor(for: state) ?? .black
        ])
        self.setAttributedTitle(attributedString, for: state)
    }
}


class CustomTextField: UITextField {
    
    
    var isVisable = true
    
    private lazy var clearButton = UIButton().then{
        $0.setImage(UIImage(named: "Clear"), for: .normal)
        $0.addTarget(self, action: #selector(cancelTap), for: .touchUpInside)
        $0.imageView?.contentMode = .scaleAspectFit // 이미지 뷰의 내용 모드를 조정
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5) // 이미지의 마진 조정
        $0.widthAnchor.constraint(equalToConstant: 20).isActive = true // 이미지 뷰의 너비를 20으로 설정
        $0.heightAnchor.constraint(equalToConstant: 20).isActive = true // 이미지 뷰의 높이를 20으로 설정
    }

    private lazy var secureButton = UIButton().then{
        $0.setImage(UIImage(named: "SecureOff"), for: .normal)
        $0.addTarget(self, action: #selector(secureToggle), for: .touchUpInside)
        $0.imageView?.contentMode = .scaleAspectFit // 이미지 뷰의 내용 모드를 조정
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5) // 이미지의 마진 조정
        $0.widthAnchor.constraint(equalToConstant: 20).isActive = true // 이미지 뷰의 너비를 20으로 설정
        $0.heightAnchor.constraint(equalToConstant: 20).isActive = true // 이미지 뷰의 높이를 20으로 설정
    }
    private lazy var buttonStack = UIStackView().then{
        $0.addArrangedSubview(clearButton)
        $0.addArrangedSubview(secureButton)
        $0.spacing = 15
        $0.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 20)
        $0.isLayoutMarginsRelativeArrangement = true
        
    }
    
    @objc func cancelTap(){
        self.text = ""
    }
    @objc func secureToggle(){
        isVisable = !isVisable
        self.isSecureTextEntry = isVisable
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    init(_ text: String){
        super.init(frame: .zero)
        commonInit()
        uiSet(text)
    }
    
    
    private func commonInit() {
        self.addTarget(self, action: #selector(textFieldTouched), for: .editingDidBegin)
        self.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEnd)
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.tvingGray1.cgColor
    }
    
    @objc private func textFieldTouched() {
        self.layer.borderColor = UIColor.tvingGray4.cgColor
    }
    
    @objc private func textFieldDidEndEditing() {
        self.layer.borderColor = UIColor.clear.cgColor
    }
    
    
    func uiSet(_ text: String){
        self.placeholder = text
        self.backgroundColor = .tvingGray1
        self.setPlaceholder(color: .tvingGray4)
        self.isEnabled = true
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        self.leftViewMode = .always
        self.autocapitalizationType = .none
        self.textColor = .tvingGray4
        self.rightView = buttonStack
        self.rightViewMode = .whileEditing
    }
}
extension CustomTextField {
    func setSecureButtonHidden(_ isHidden: Bool) {
        secureButton.isHidden = isHidden
    }
}
