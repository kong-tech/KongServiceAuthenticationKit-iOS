//
//  GetMeUseCase.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/07.
//  Copyright © 2020 KONGTech. All rights reserved.
//

import Foundation

public protocol GetMeUseCase{
    
    func getMe(onComplete: @escaping (Result<GetMeResponse, Error>)->Void)
    
}

public struct DefaultGetMeUseCase:GetMeUseCase{
    let apiRequest:HttpRequest<API>
    
    public init(){
        apiRequest = HttpRequest<API>(.me)
    }
    
    public func getMe(onComplete: @escaping (Result<GetMeResponse, Error>) -> Void) {
        apiRequest.request { (result) in
            switch result{
            case .success(let response):
                guard let data = response.data, data.count > 0 else {
                    onComplete(.failure(NSError(domain: "DefaultGetMeUseCase", code: -1, userInfo: ["description":"no response Data"])))
                    return
                }
                
                do{
                    
                    let responseData = try JSONDecoder().decode(APIResponse<GetMeResponse>.self, from: data)
                    onComplete(.success(responseData.data))
                    
                }catch let error{
                    onComplete(.failure(error))
                }
                
            case .failure(let error):
                onComplete(.failure(error))
            }
        }
    }
}
