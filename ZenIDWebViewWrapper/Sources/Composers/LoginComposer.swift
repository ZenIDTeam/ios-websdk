//
//  LoginComposer.swift
//  ZenIDWebViewWrapper
//
//  Created by Vladimir Belohradsky on 16.07.2024.
//

import UIKit

final class LoginComposer {
    
    static func compose() -> LoginViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        viewController.credentialsService = resolve()
        viewController.showWebView = {
            self.showWebView(from: viewController)
        }
        return viewController
    }
    
    private static func showWebView(from viewController: UIViewController) {
        let webViewController = WebViewComposer.compose()
        let navigationController = UINavigationController(rootViewController: webViewController)
        navigationController.modalPresentationStyle = .fullScreen
        viewController.present(navigationController, animated: true, completion: nil)
    }
    
    private static func resolve() -> CredentialsService {
        PlistCredentialsService.shared
    }
    
}
