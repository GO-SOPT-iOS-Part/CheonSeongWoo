//
//  MoveViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 천성우 on 2023/04/06.
//

import UIKit

class MoveViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let toggleText = UILabel()
        toggleText.text = "Switch"
        toggleText.textColor = .black
        return toggleText
    }()
    
    lazy var toggleSwitch: UISwitch = {
       let toSwitch = UISwitch()
        toSwitch.addTarget(self, action: #selector(toggleSwitchChanged(_:)), for: .valueChanged)
        return toSwitch
    }()
    
    private let onImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "lightswitch.on")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true // 초기값으로 이미지는 숨겨진 상태로 설정

        return imageView
    }()

    private let offImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "lightswitch.on.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true // 초기값으로 이미지는 숨겨진 상태로 설정
        return imageView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }
    
}

extension MoveViewController{
    private func style(){
        view.backgroundColor = .white
    }
    func setLayout() {
        [nameLabel, toggleSwitch, onImageView, offImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([toggleSwitch.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     toggleSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     toggleSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     toggleSwitch.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([onImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     onImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     onImageView.widthAnchor.constraint(equalToConstant: 150),
                                     onImageView.heightAnchor.constraint(equalToConstant: 150)])
        
        NSLayoutConstraint.activate([offImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                      offImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                      offImageView.widthAnchor.constraint(equalToConstant: 150),
                                      offImageView.heightAnchor.constraint(equalToConstant: 150)])
    }
    
    @objc func toggleSwitchChanged(_ sender: UISwitch) {
        if sender.isOn {
            nameLabel.text = "ON"
            onImageView.isHidden = false
            offImageView.isHidden = true
        } else {
            nameLabel.text = "OFF"
            onImageView.isHidden = true
            offImageView.isHidden = false
        }
    }

}
