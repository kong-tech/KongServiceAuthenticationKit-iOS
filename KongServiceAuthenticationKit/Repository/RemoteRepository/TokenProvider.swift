//
//  TokenProvider.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/07.
//  Copyright © 2020 KONGTech. All rights reserved.
//

import Foundation

class TokenProvider{
    static let shared = TokenProvider()
    enum Key{
        static let AccessToken:String = "com.kontech.accessToken"
    }
    
    let suite = UserDefaults(suiteName: "com.kontech.tokenprovider")
    
    static var accesstoken:String?{
        set{shared.suite?.set(newValue, forKey: Key.AccessToken)}
        get{shared.suite?.string(forKey: Key.AccessToken)}
    }
    
    static func clear(){
        shared.suite?.removeObject(forKey: Key.AccessToken)
    }
}


