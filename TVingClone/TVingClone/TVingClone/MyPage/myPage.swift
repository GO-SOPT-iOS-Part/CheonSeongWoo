import UIKit

struct myPage {
    let title: String
    let image: UIImage
}

extension myPage {
    static func dummy1() -> [myPage] {
        return [myPage(title: "이용권", image: UIImage(named: "Mark")!),
                myPage(title: "1:1 문의내역", image: UIImage(named: "Mark")!),
                myPage(title: "예약알림", image: UIImage(named: "Mark")!),
                myPage(title: "회원정보 수정", image: UIImage(named: "Mark")!),
                myPage(title: "프로모션 정보 수신 동의", image: UIImage(named: "Mark")!)]
    }
    static func dummy2() -> [myPage] {
        [myPage(title: "공지사항", image: UIImage(named: "Mark")!),
         myPage(title: "이벤트", image: UIImage(named: "Mark")!),
         myPage(title: "고객센터", image: UIImage(named: "Mark")!),
         myPage(title: "티빙 알이보기", image: UIImage(named: "Mark")!)]
    }
}
