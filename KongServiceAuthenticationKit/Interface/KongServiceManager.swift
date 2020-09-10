//
//  KongServiceManager.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/08.
//  Copyright © 2020 KONGTech. All rights reserved.
//

import Foundation

public class KongServiceManager{
    
    let getMeUseCase:GetMeUseCase
    
    public init(){
        self.getMeUseCase = DefaultGetMeUseCase()
    }
}

// MARK: - Interface
public extension KongServiceManager{
    
    func getMe(onComplete: @escaping (Result<GetMeResponse, Error>) -> Void){
        guard TokenProvider.accesstoken != nil else {
            onComplete(.failure(NSError(domain: "KongServiceManager.getMe", code: -1, userInfo: ["description":"no Token"])))
            return
        }
        getMeUseCase.getMe(onComplete: onComplete)
    }
    
    func set(token:String){
        TokenProvider.accesstoken = token
    }
    
    func clearToken(){
        TokenProvider.clear()
    }
    
    var accessToken:String?{
        TokenProvider.accesstoken
    }
}
