//
//  AutoLayoutViewController.swift
//  32th_First_Seminar
//
//  Created by 천성우 on 2023/04/08.
//

import UIKit
import SnapKit
import Then

@objc
protocol TapButton: AnyObject{
    @objc
    optional func buttonTapped(count: Int)
}

final class SecondViewController_Lab: UIViewController {
    
    private let countLabel = UILabel()
    private lazy var countButton = UIButton()
    private lazy var dismissButton = UIButton()
    
    weak var delegate: TapButton?
    private var tap_count: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }
}

private extension SecondViewController_Lab {
    func style(){
        view.backgroundColor = .white
        
        countLabel.do{
            $0.textColor = .blue
            $0.text = "횟수는 !?"

        }
        countButton.do {
            $0.setTitle("눌러주세요", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.backgroundColor = .link
            $0.addTarget(self,
                         action: #selector(countButtonTapped),
                         for: .touchUpInside)
            $0.layer.cornerRadius = 10

        }
        dismissButton.do {
            $0.setTitle("뒤로가기", for: .normal)
            $0.setTitleColor(.red, for: .normal)
            $0.backgroundColor = .link
            $0.addTarget(self,
                         action: #selector(dismissButtonTapped),
                         for: .touchUpInside)
            $0.layer.cornerRadius = 10
        }
    }
    func setLayout(){
        [countLabel, countButton, dismissButton].forEach{ view.addSubview($0) }
        
        countLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(44)
        }
        
        countButton.snp.makeConstraints{
            $0.top.equalTo(countLabel.snp.bottom).offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(44)
            $0.centerX.equalToSuperview()
        }
        
        dismissButton.snp.makeConstraints{
            $0.top.equalTo(countButton.snp.bottom).offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(44)
            $0.centerX.equalToSuperview()
        }
    }
    
    
    @objc
    func dismissButtonTapped() {
        delegate?.buttonTapped?(count: tap_count)
        self.dismiss(animated: true)
    }
    @objc
    func countButtonTapped(){
        tap_count += 1
        print(tap_count)
    }
    
}
