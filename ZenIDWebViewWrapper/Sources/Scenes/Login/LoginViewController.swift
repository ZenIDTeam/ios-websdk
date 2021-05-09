//
//  LoginViewController.swift
//  ZenIDWebViewWrapper
//
//  Created by Vladimir Belohradsky on 16.07.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UITextField?
    @IBOutlet weak var passwordLabel: UITextField?
    @IBOutlet weak var URLLabel: UITextField?
    
    var showWebView: (() -> Void)?
    
    var credentialsService: CredentialsService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didPressDoneButton(_ sender: Any) {
        guard
            let username = usernameLabel?.text,
            let password = passwordLabel?.text,
            let url = URLLabel?.text,
            !username.isEmpty,
            !password.isEmpty,
            !url.isEmpty
        else { return }
        
        credentialsService?.username = username
        credentialsService?.password = password
        credentialsService?.url = url
        
        showWebView?()
    }
    
    @IBAction func didPressEnterButton(_ sender: UITextField) {
        switch sender.tag {
        case 0: passwordLabel?.becomeFirstResponder()
        case 1: URLLabel?.becomeFirstResponder()
        case 2: didPressDoneButton(sender)
        default: break
        }
    }
}
