import UIKit


//protocol DataBindProtocol: AnyObject {
//    func dataBind(text: String)
//}



final class SecondViewController_DelegatePattern: BaseViewController {
    
    // MARK: - Closure를 통한 데이터 전달
    //    var completionHandler: ((String) -> (Void))
    typealias handler = ((String) -> (Void))
    var completionHandler: handler?
    
    private let originView = CommonView()
    
    override func loadView() {
        self.view = originView
    }
}

// 만약 BaseView에서 불러오는 setStyle을 편집하고 싶다면 override하면 됨.
