import UIKit

// MARK: - UIWindowSceneDelegate
/*
 UIWindowSceneDelegate는 사용자가 보는 화면을 나타내는 UIWindow객체의 생명주기를 관리하고
 필요에 따라 새로운 UIWinodw객체를 생성하거나. 기존의 객체를 닫거나 교체하는 역할을 함.
 
 또한 앱에서 많은 UIWindow가 있는 환경에서 각 Window에 대한 이벤트를 처리하는 메소드를 정의할 수 있으며
 UIWinodwScene객체는 하나 이상의 UIWindow객체를 가질 수 없다.
 */
// MARK: - UIResponder
/*
 UIResponder는 iOS 앱에서 이벤트 처리와 관련된 기능을 제공하는 추상 클래스임.
 iOS 앱에서 이벤트 처리와 관련된 기능을 구현하는 데 중요한 역할을 하며 사용자의 이벤트와 상호 작용(터치, 제스처)에 반응하여, 처리와 관련된 작업을 할 수 있는 메소드를 제공함
 */

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        // MARK: - 1. 현재의 scene이 UIWindowScene인지 확인.
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // MARK: - 2. 앱 내부에서 사용할 UIWindow를 생성한다. 이는 이후 앱의 뷰 계층 구조를 관리하는데 사용할 수 있다.
        self.window = UIWindow(windowScene: windowScene)
        
        // MARK: - 3. 이 과정에서 생성된 UINavigationController는 앱 뷰 컨트롤러를 관리하는 데 사용되며 rootViewController는 앱의 뷰 계층 구조에서 최상위 view 컨드롤러 입니다.
        
        let navigationController = UINavigationController(rootViewController: ViewController())
        self.window?.rootViewController = navigationController
        
        // MARK: - 4. UIWindow를 화면에 표시하도록 설정하는 것.
        self.window?.makeKeyAndVisible()
    }
}
