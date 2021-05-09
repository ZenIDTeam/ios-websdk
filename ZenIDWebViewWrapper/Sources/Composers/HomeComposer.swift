
import Foundation
import UIKit


final class HomeComposer {
    
    static func compose() -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! ViewController
        viewController.showLogin = {
            self.showLogin(from: viewController)
        }
        viewController.cameraPermission = resolve()
        return viewController
    }
    
    private static func showLogin(from viewController: UIViewController) {
        let loginController = LoginComposer.compose()
        let navigationController = UINavigationController(rootViewController: loginController)
        navigationController.modalPresentationStyle = .fullScreen
        viewController.present(navigationController, animated: true, completion: nil)
    }
    
    private static func resolve() -> CameraPermission {
        MainDispatchDecorator(decoratee: iOSCameraPermission())
    }
    
}

extension MainDispatchDecorator: CameraPermission where DecorateeType: CameraPermission {
    func authorize(completion: @escaping (Bool) -> Void) {
        decoratee.authorize { [weak self] granted in
            self?.performOnMainThread {
                completion(granted)
            }
        }
    }
}
