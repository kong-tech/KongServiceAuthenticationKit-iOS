//
//  KongServiceLogin.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/01.
//  Copyright © 2020 KONGTech. All rights reserved.
//
#if os(iOS)

import UIKit


public typealias KongServiceLoginPresentationAnchor = UIWindow

@available(iOS 9.0, *)
public protocol KongServiceLoginControllerPresentationContextProviding:class{
    func presentationAnchor(for controller:KongServiceLoginController) -> KongServiceLoginPresentationAnchor
    
}

@available(iOS 9.0, *)
public protocol KongServiceLoginControllerDelegate:class{
    func kongServiceLoginController(_ controller:KongServiceLoginController, didLoginSuccess accessToken:String)
    func kongServiceLoginControllerLoginCanceled(_ controller:KongServiceLoginController)
}

@available(iOS 9.0, *)
public class KongServiceLoginController{
    
    let loginViewController:KongServiceLoginViewController
    
    public weak var delegate:KongServiceLoginControllerDelegate?
    public weak var presentationContextProvider:KongServiceLoginControllerPresentationContextProviding?
    
    
    public init(serviceType:ServiceType){
        self.loginViewController = KongServiceLoginViewController(serviceType: serviceType)
    }
    
    public func performRequests(){
        guard let anchor = presentationContextProvider?.presentationAnchor(for: self) else { return }
        loginViewController.modalPresentationStyle = .fullScreen
        loginViewController.modalTransitionStyle = .coverVertical
        loginViewController.delegate = self
        
        anchor.rootViewController?.present(loginViewController, animated: true, completion: nil)
    }
}

@available(iOS 9.0, *)
extension KongServiceLoginController:KongServiceLoginViewControllerDelegate{
    func kongServiceLoginViewController(_ loginViewController: KongServiceLoginViewController, loginSuccessWith accessToken: String) {
        loginViewController.dismiss(animated: true, completion: { [weak self] in
            guard let self = self else { return }
            if accessToken.contains("Bearer"){
                let removedBearerToken = String(accessToken.split(separator: " ").last ?? "")
                self.delegate?.kongServiceLoginController(self, didLoginSuccess: removedBearerToken)
            }else{
                self.delegate?.kongServiceLoginController(self, didLoginSuccess: accessToken)
            }
        })
    }
    
    func kongServiceLoginViewControllerLoginCanceled(_ loginViewController: KongServiceLoginViewController) {
        delegate?.kongServiceLoginControllerLoginCanceled(self)
    }
    
}

#endif
