//
//  AutoLayoutViewController.swift
//  32th_First_Seminar
//
//  Created by 천성우 on 2023/04/08.
//

import UIKit
import SnapKit
import Then

final class AutoLayoutViewController: UIViewController {
    
    private let view1 = UIView()
    private let view2 = UIView()
    private let view3 = UIView()
    private let view4 = UIView()
    
    private let screenMaxWidth = UIScreen.main.bounds.width
    private let screenMaxHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }
}

private extension AutoLayoutViewController {
    func style(){
        view.backgroundColor = .white
        
        view1.do{
            $0.backgroundColor = .yellow
        }
        view2.do{
            $0.backgroundColor = .green
        }
        view3.do{
            $0.backgroundColor = .black
        }
        view4.do{
            $0.backgroundColor = .blue
        }
    }
    func setLayout(){
        [view1, view2, view3, view4].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        view1.snp.makeConstraints{
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(screenMaxWidth/2)
            $0.height.equalTo(screenMaxHeight/4)
        }
        view2.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.leading.equalTo(view1.snp_trailing)
            $0.top.equalTo(view1.snp_bottom)
            $0.height.equalTo(screenMaxHeight/4)
        }
        view3.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.top.equalTo(view2.snp_bottom)
            $0.trailing.equalTo(view2.snp_leading)
            $0.height.equalTo(screenMaxHeight/4)
        }
        view4.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.top.equalTo(view3.snp_bottom)
            $0.leading.equalTo(view3.snp_trailing)
            $0.height.equalTo(screenMaxHeight/4)

        }

    }
}
