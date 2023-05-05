import UIKit
import SnapKit
import Then

final class MyPageViewController: BaseViewController {
    
    private let headerView = MyPageHeaderView()
    private let dummy1 = myPage.dummy1()
    private let dummy2 = myPage.dummy2()
    
    private lazy var tableView = UITableView(frame: .zero, style: .grouped).then {
        $0.register(MyPageTableViewCell.self, forCellReuseIdentifier: MyPageTableViewCell.identifier)
        $0.register(MyPageHeaderView.self, forHeaderFooterViewReuseIdentifier: "MyPageHeaderView")
        $0.register(SettingFooterView.self, forHeaderFooterViewReuseIdentifier: "SettingFooterView")
        $0.register(LogoutFooterView.self, forHeaderFooterViewReuseIdentifier: "LogoutFooterView")
        $0.rowHeight = 54
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .black
    }
    
    override func attribute() {
        tableView.register(MyPageHeaderView.self,
                           forHeaderFooterViewReuseIdentifier: MyPageHeaderView.cellIdentifier)
        tableView.register(SettingFooterView.self,
                           forHeaderFooterViewReuseIdentifier: SettingFooterView.cellIdentifier)
        tableView.register(LogoutFooterView.self,
                           forHeaderFooterViewReuseIdentifier: LogoutFooterView.cellIdentifier)
    }
    
    override func setStyle() {
        view.backgroundColor = .black
    }
    
    override func setLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    @objc
    private func closeProfile() {
        print("??")
        self.navigationController?.popViewController(animated: true)
        
    }
}

//MARK: - 해석이 좀 더 필요한 코드들


extension MyPageViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    //MARK: - section의 id(?)가 0일 때 그에 해당하는 MyPageHeaderView의 backButton에 액션 추가
    //MARK:   만약 그렇지 않다면 빈 UIView 반환
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let myPageHeaderView = MyPageHeaderView()
            myPageHeaderView.backButton.addTarget(self, action: #selector(closeProfile), for: .touchUpInside)
            return myPageHeaderView
        default:
            return UIView()
        }
    }
    
    //MARK: - 섹션 헤더의 높이를 지정하는 메소드로 section이 0이면 높이를 351로 설정하고
    //MARK:   아닐 경우는 높이를 0으로 지정. 즉, section 0에 해당하는 헤더만 공간을 만들겠다
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 351 : 0
    }
    
    //MARK: - UITableViewDelegate 프로토콜의 메소드로 각 섹션에 맞는 뷰를 반환하는 메소드
    //MARK:   각 섹션에 미리 지정해둔 FooterView를 가지고 와 반환
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section {
        case 0 :
            guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: SettingFooterView.cellIdentifier) as? SettingFooterView else { return UIView() }
            return view
        case 1 :
            guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: LogoutFooterView.cellIdentifier) as? LogoutFooterView else { return UIView() }
            return view
        default :
            return UIView()
        }
    }
    
    //MARK: - 특정 Section에 따른 footerView의 높이를 지정
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 0 ? 32 : 90
    }
    //MARK: - TableView에 몇 개의 Section이 있는지를 반환
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //MARK: - 각 Section별로 TableView의 Rows 수를 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return dummy1.count
        case 1:
            return dummy2.count
        default :
            return 0
        }
    }
    
    //MARK: - TableViewCell의 인스턴스를 사용하여 셀을 구성하는 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageTableViewCell.identifier, for: indexPath) as? MyPageTableViewCell else { return UITableViewCell() }
        
        if indexPath.section == 0 {
            cell.configureCell(dummy1[indexPath.row])
        } else if indexPath.section == 1 {
            cell.configureCell(dummy2[indexPath.row])
        } else {
            return UITableViewCell()
        }
        return cell
    }
}
