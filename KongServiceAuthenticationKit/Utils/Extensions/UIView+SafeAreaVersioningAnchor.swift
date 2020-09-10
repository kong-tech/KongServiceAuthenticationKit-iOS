//
//  UIView+SafeAreaVersioningAnchor.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/01.
//  Copyright © 2020 KONGTech. All rights reserved.
//

import UIKit
@available(iOS 9.0, *)
extension UIView{
    var versioningSafeAreaLeadingAnchor:NSLayoutXAxisAnchor{
        if #available(iOS 11.0, *) {
            
            return safeAreaLayoutGuide.leadingAnchor
            
        } else {
            
            return leadingAnchor
            
        }
    }
    
    var versioningSafeAreaTrailingAnchor:NSLayoutXAxisAnchor{
        if #available(iOS 11.0, *) {
            
            return safeAreaLayoutGuide.trailingAnchor
            
        }else {
            
            return trailingAnchor
            
        }
    }
    
    var versioningSafeAreaTopAnchor:NSLayoutYAxisAnchor{
        if #available(iOS 11.0, *) {
            
            return safeAreaLayoutGuide.topAnchor
            
        }else {
            
            return topAnchor
            
        }
    }
    
    var versioningSafeAreaBottomAnchor:NSLayoutYAxisAnchor{
        if #available(iOS 11.0, *) {
            
            return safeAreaLayoutGuide.bottomAnchor
            
        }else {
            
            return bottomAnchor
            
        }
    }
    
    var versioningSafeAreaCenterXAnchor:NSLayoutXAxisAnchor{
        if #available(iOS 11.0, *) {
            
            return safeAreaLayoutGuide.centerXAnchor
            
        }else {
            
            return centerXAnchor
            
        }
    }
    
    var versioningSafeAreaCenterYAnchor:NSLayoutYAxisAnchor{
        if #available(iOS 11.0, *) {
            
            return safeAreaLayoutGuide.centerYAnchor
            
        }else {
            
            return centerYAnchor
            
        }
    }
    
}
