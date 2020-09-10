//
//  UITraitCollection+DarkModeVersioning.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/01.
//  Copyright © 2020 KONGTech. All rights reserved.
//

import UIKit
@available(iOS 9.0, *)
extension UITraitCollection{
    var isDarkMode:Bool{
        if #available(iOS 12.0, *) {
            return userInterfaceStyle == .dark
        } else {
            return false
        }
    }
}
