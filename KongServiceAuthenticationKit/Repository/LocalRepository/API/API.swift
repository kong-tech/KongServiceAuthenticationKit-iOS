//
//  API.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/07.
//  Copyright © 2020 KONGTech. All rights reserved.
//

import Foundation

enum API{
    
    case me
    
}

extension API:HttpRequestInterface{
    var baseURL: String{
        switch self{
        case .me:
            return "https://kongservice.com/api"
        }
        
    }
    
    var path: String {
        switch self{
        case .me:
            return "/v1/accounts/me"
        }
        
    }
    
    var method: HttpMethod {
        switch self{
        case .me:
            return .get
        }
    }
    
    var header: [String : String] {
        switch self{
        case .me:
            guard let token = TokenProvider.accesstoken else { return [:]}
            return ["Content-type": "application/json",
                    "Authorization":"Bearer \(token)"]
            
        }
        
    }
    
    var parameter: HttpRequestParameterType {
        switch self{
            
        case .me:
            return .plain
        }
    }
}
