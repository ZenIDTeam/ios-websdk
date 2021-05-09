
import UIKit


final class ViewController: UIViewController {
    
    var cameraPermission: CameraPermission?
    var showLogin: (() -> Void)?

    @IBOutlet weak var showLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebViewButton()
    }
    
    private func setupWebViewButton() {
        showLoginButton.backgroundColor = UIColor.cyan
        showLoginButton.layer.cornerRadius = 6.0
        showLoginButton.clipsToBounds = true
        showLoginButton.setTitleColor(.black, for: .normal)
        showLoginButton.setTitle(NSLocalizedString("Open ZenID Web", comment: ""), for: .normal)
        showLoginButton.addTarget(self, action: #selector(showLoginButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func showLoginButtonPressed() {
        checkCameraPermission { [weak self] in
            self?.showLogin?()
        }
    }
    
    private func checkCameraPermission(onSuccess: @escaping () -> Void) {
        cameraPermission?.authorize(completion: { granted in
            if granted {
                onSuccess()
            }
        })
    }

}

