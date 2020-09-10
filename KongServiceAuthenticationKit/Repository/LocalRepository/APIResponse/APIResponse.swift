//
//  APIResponse.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/07.
//  Copyright © 2020 KONGTech. All rights reserved.
//

import Foundation

struct APIResponse<ResponseData:Codable>:Codable{
    let data:ResponseData
}


public struct GetMeResponse:Codable{
    public let accountId:Int
    public let phoneNumber:String?
    public let userName:String?
    public let passwordChangedAt:String?
    public let users:[User]?
    public let workspaces:[WorkSpace]?
}

public struct User:Codable{
    public let userId:Int?
    public let emailAddress:String?
    public let username:String?
    public let subdomainName:String?
    public let workspaceName:String?
}

public struct WorkSpace:Codable{
    public let userId:Int
    public let emailAddress:String
    public let username:String
    public let subdomainName:String
    public let workspaceId:Int
    public let workspaceName:String
    public let kongServiceType:[String]
}

