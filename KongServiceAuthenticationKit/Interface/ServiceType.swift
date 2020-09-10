//
//  ServiceType.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/07.
//  Copyright © 2020 KONGTech. All rights reserved.
//

import Foundation

@available(iOS 9.0, *)
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
