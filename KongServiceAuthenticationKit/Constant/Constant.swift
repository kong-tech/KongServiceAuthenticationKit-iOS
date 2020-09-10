//
//  Constant.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/01.
//  Copyright © 2020 KONGTech. All rights reserved.
//


#if os(iOS)

@available(iOS 9.0, *)
extension KongServiceLoginController{
    enum Constant{
        static let urlString            = "https://kongservice.com/sign-in/callback?url=/blank&darkMode=false"
        static let urlStringDarkMode    = "https://kongservice.com/sign-in/callback?url=/blank&darkMode=true"
    }
    
    public enum ServiceType{
        case kongPass
        case kongEco
        case kongRTLS
        case custom(serviceName:String)
        
        var string:String{
            switch self{
                
            case .kongPass:
                return "KONG_PASS"
            case .kongEco:
                return "KONG_ECO"
            case .kongRTLS:
                return "KONG_RTLS"
            case .custom(let serviceName):
                return serviceName
            }
        }
    }
}

#endif
