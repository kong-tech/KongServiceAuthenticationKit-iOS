//
//  KongServiceLoginViewController+UI.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/01.
//  Copyright © 2020 KONGTech. All rights reserved.
//
#if os(iOS)

import UIKit
import WebKit

@available(iOS 9.0, *)
extension KongServiceLoginViewController{
    
    func setupUI(){
        self.view.backgroundColor = self.traitCollection.isDarkMode ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let topLayoutGuide = UILayoutGuide()
        self.view.addLayoutGuide(topLayoutGuide)
        
        NSLayoutConstraint.activate([
            topLayoutGuide.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            topLayoutGuide.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            topLayoutGuide.topAnchor.constraint(equalTo: self.view.versioningSafeAreaTopAnchor),
            topLayoutGuide.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        closeBtn = CustomButton()
        
        closeBtn.translatesAutoresizingMaskIntoConstraints = false        
        closeBtn.backgroundColor = .clear
        closeBtn.tintColor = self.traitCollection.isDarkMode ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.1294117647, green: 0.1490196078, blue: 0.1803921569, alpha: 1)
            
            
            
        self.view.addSubview(closeBtn)
        
        NSLayoutConstraint.activate([
            closeBtn.leadingAnchor.constraint(equalTo: topLayoutGuide.leadingAnchor),
            closeBtn.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor),
            closeBtn.bottomAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
            closeBtn.widthAnchor.constraint(equalTo: topLayoutGuide.heightAnchor, multiplier: 1)        
        ])
        
        
        
        let webConfiguration = WKWebViewConfiguration()
        
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
            webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }
}

#endif
