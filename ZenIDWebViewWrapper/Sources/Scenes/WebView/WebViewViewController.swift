
import UIKit
import WebKit


final class WebViewViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!
    
    var credentialsService: CredentialsService!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLoadingIndicatorView()
        setupWebView()
        setupCancelButton()
        loadWeb()
    }
    
    private func setupLoadingIndicatorView() {
        loadingIndicatorView.hidesWhenStopped = true
    }
    
    private func setupWebView() {
        webView.configuration.allowsInlineMediaPlayback = true
        webView.configuration.mediaTypesRequiringUserActionForPlayback = []
        webView.navigationDelegate = self
    }
    
    private func setupCancelButton() {
        let cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
        navigationItem.leftBarButtonItem = cancelBarButtonItem
    }
    
    private func loadWeb() {
        loadingIndicatorView.startAnimating()
        let urlRequest = URLRequest(url: URL(string: credentialsService.url)!)
        webView.load(urlRequest)
    }
    
    private func stopLoading() {
        loadingIndicatorView.stopAnimating()
    }
    
    @objc
    private func cancelButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
}


extension WebViewViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        stopLoading()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        stopLoading()
    }
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let credential = URLCredential(
            user: credentialsService.username,
            password: credentialsService.password,
            persistence: .forSession
        )
        completionHandler(.useCredential, credential)
    }
    
}
