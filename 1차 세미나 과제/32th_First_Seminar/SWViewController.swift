//
//  SWViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 천성우 on 2023/04/01.
//

import UIKit

class SWViewController: UIViewController {
    
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요!?"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("present!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self,
                         action: #selector(presentButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self,
                         action: #selector(pushButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    // MARK: - 과제 추가한 코드
    private lazy var moveButton: UIButton = {
        let button = UIButton()
        button.setTitle("move", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self,
                         action: #selector(pushButtonMove),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }
    
    
    
    
}


private extension SWViewController { // ViewController 확장.
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() { // Layout set
        
        [nameLabel, nameTextField,
         presentButton, pushButton, moveButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
        // MARK: - 과제 추가한 코드
        NSLayoutConstraint.activate([moveButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 20),
                                     moveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     moveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     moveButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    func presentToSecondViewController() {
        guard let name = nameTextField.text else { return }
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.dataBind(name: name)
        self.present(secondViewController, animated: true)
    }
    
    func pushToSecondViewController() {
        guard let name = nameTextField.text else { return }
        let secondViewController = SecondViewController()
        secondViewController.dataBind(name: name)
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
    }
    // MARK: - 과제 추가한 코드
    func moveToImageViewController(){
        let moveViewController = MoveViewController()
        self.navigationController?.pushViewController(moveViewController, animated: true)
    }
    
    @objc
    func presentButtonTapped() {
        presentToSecondViewController()
    }
    
    @objc
    func pushButtonTapped() {
        pushToSecondViewController()
    }
    // MARK: - 과제 추가한 코드
    @objc
    func pushButtonMove() {
        moveToImageViewController()
    }
}
