//
//  HttpRequest+Options.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/07.
//  Copyright © 2020 KONGTech. All rights reserved.
//

import Foundation

// MARK: - Enums
enum HttpMethod:String{
    case get        = "GET"
    case head       = "HEAD"
    case post       = "POST"
    case put        = "PUT"
    case delete     = "DELETE"
    case connect    = "CONNECT"
    case patch      = "PATCH"
    case options    = "OPTIONS"
    case trace      = "TRACE"
}

enum HttpRequestParameterType{
    case plain
    case urlEncoding(parameter:[String:Any])
    case jsonEncoding(parameter:[String:Any])
    case formData(parameter:[String:Any])
}

struct Response{
    let data:Data?
    let statusCode:Int
}
