import UIKit

final class ViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "솝트에 오신 여러분 환영합니다!"
        label.textColor = .blue
        return label
    }()

    // MARK: - viewDidLoad
    /*
     UIViewController객체가 실행되고 난 뒤 바로 호출되는 메소드입니다.
     + 해당 뷰 컨트롤러의 뷰 계층 구조가 메모리에 로드된 직후에 호출 되는 메소드. */
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}

private extension ViewController {
    func setStyle() {
        view.backgroundColor = .white
    }
    func setLayout() {
        // MARK: - translatesAutoresizingMaskIntoConstraints = false를
                // 해줘야 오토레이아웃을 적용시킬 수 있음..? 이게 맞나
        // 추가로 저렇게 해야 객체의 위치를 수동으로 적용시킬 수 있음
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - view.addSubview(sopt)
        /*
         sopt라는 객체를 현재 뷰 컨트롤러의 뷰 계층 구조에 추가하는 코드.
         */
        view.addSubview(nameLabel)
        
        // MARK: - nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300)는
                //nameLabel의 객체의 위 여백이 view 객체에 300만큼 거리를 둔다..?
        // 이후 코드는 흐름이 비슷하고 왼쪽 여백을 50준다라는 말임.
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)])
    }
}
