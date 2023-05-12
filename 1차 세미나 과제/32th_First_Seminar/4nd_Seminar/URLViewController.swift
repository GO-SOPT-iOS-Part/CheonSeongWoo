import UIKit

final class URLViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        signUp()
    }
    
    private func signUp() {
        
        SignUpService.shared.signUp(email: "cjs1399@gmail.com",
                                    nickname: "cjstjddn",
                                    password: "201369Cjs!") { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                dump(data)
            default:
                return
            }
        }
    }
}
