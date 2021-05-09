
import Foundation
import UIKit


final class WebViewComposer {
    
    static func compose() -> WebViewViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "WebViewViewController") as! WebViewViewController
        viewController.credentialsService = resolve()
        return viewController
    }
    
    private static func resolve() -> CredentialsService {
        PlistCredentialsService.shared
    }
    
}
