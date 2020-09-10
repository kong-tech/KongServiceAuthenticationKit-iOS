//
//  KongServiceLoginViewController.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/01.
//  Copyright © 2020 KONGTech. All rights reserved.
//

#if os(iOS)

import UIKit
import WebKit

@available(iOS 9.0, *)
protocol KongServiceLoginViewControllerDelegate:class{
    func kongServiceLoginViewController(_ loginViewController:KongServiceLoginViewController, loginSuccessWith accessToken:String)
    func kongServiceLoginViewControllerLoginCanceled(_ loginViewController:KongServiceLoginViewController)
}

@available(iOS 9.0, *)
class KongServiceLoginViewController: UIViewController, WKUIDelegate {
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    var webView:WKWebView!
    var closeBtn:CustomButton!
    
    weak var delegate:KongServiceLoginViewControllerDelegate?
    
    var loginViewUrl:URL{
        
        var urlString = traitCollection.isDarkMode ? KongServiceLoginController.Constant.urlStringDarkMode : KongServiceLoginController.Constant.urlString
        
        if let serviceType = self.serviceType{
            urlString = urlString + "&" + "serviceType=\(serviceType.string)"
        }
        
        if let url = URL(string:urlString){
            return url
        }else{
            fatalError("URL 에러")
        }
    }
    
    var serviceType:KongServiceLoginController.ServiceType?
    
    init(serviceType:KongServiceLoginController.ServiceType){
        super.init(nibName: nil, bundle: nil)
        self.serviceType = serviceType
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self.view.backgroundColor = self.traitCollection.isDarkMode ? #colorLiteral(red: 0.1294117647, green: 0.1490196078, blue: 0.1803921569, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAction()
        
        let request = URLRequest(url: loginViewUrl)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.load(request)
        
    }
    
}
@available(iOS 9.0, *)
extension KongServiceLoginViewController:WKNavigationDelegate{
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        if isLoginFinishUrl{
            getToken(completion: { [weak self] (accessToken) in
                guard let self = self else { return }
                self.clearLocalStorage { [weak self] in
                    guard let self = self else { return }
                    self.delegate?.kongServiceLoginViewController(self, loginSuccessWith: accessToken)
                }
            }) { (error) in
                ERROR_LOG(error)
            }
        }
        decisionHandler(WKNavigationResponsePolicy.allow)
    }
    
    var isLoginFinishUrl:Bool{
        guard let urlString = self.webView.url?.absoluteString, urlString.contains("kongservice.com/blank") else { return false }
        return true
    }
    
    
    func getToken(completion:@escaping (_ accessToken:String) -> Void, onError:@escaping (Error) -> Void){
        self.webView.evaluateJavaScript("localStorage.getItem(\"accessToken\")") { (accessToken, error) in
            guard let accessToken = accessToken as? String,error == nil else {
                ERROR_LOG(error!)
                onError(error!)
                return
            }
            completion(accessToken)
        }
    }
    
    func clearLocalStorage(completion: @escaping ()->Void ){
        self.webView.evaluateJavaScript("delete localStorage['accessToken']") { (result, error) in
            guard error == nil else { ERROR_LOG(error!); return }
            completion()
        }
    }
}

#endif
