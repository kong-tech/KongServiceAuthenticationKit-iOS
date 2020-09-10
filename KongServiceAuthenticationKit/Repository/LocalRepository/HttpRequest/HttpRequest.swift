//
//  HttpRequest.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/07.
//  Copyright © 2020 KONGTech. All rights reserved.
//

import Foundation

protocol HttpRequestInterface{
    var baseURL:String { get }
    var path:String { get }
    var method:HttpMethod {get}
    var header:[String:String] {get}
    var parameter:HttpRequestParameterType {get}
}


class HttpRequest<Interface:HttpRequestInterface>{
    
    private let session:URLSession = URLSession.shared
    private var request:URLRequest!
    private var timeOutLimit:TimeInterval = 10
    private var interface:Interface
    init(_ interface:Interface){
        self.interface = interface
    }
    
    
    func request(onCompletion:@escaping (Result<Response,Error>) -> Void){
        let requestURL:String =  interface.baseURL + interface.path
        
        let url = URL(string:requestURL)!
        request = URLRequest(url: url)
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        switch interface.parameter{
        case .plain:
            break
            
        case .urlEncoding(parameter: let parameter):
            let queryItems = parameter.map {
                return URLQueryItem(name: "\($0)", value: "\($1)")
            }
            urlComponents?.queryItems = queryItems
            
        case .jsonEncoding(parameter: let parameter):
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
            
        case .formData(parameter: let parameter):
            var data = [String]()
            for (key, value) in parameter{
                data.append(key + "=\(value)")
            }
            request.httpBody = data.map{ String($0) }.joined(separator:"&").data(using: .utf8)
            
        }
        
        request.url = urlComponents?.url
        request.allHTTPHeaderFields = interface.header
        request.httpMethod = interface.method.rawValue
        request.timeoutInterval = 10
        
        
        DEBUG_LOG(
            """

            ---------------Request--------------
                URL : \(request.url!.absoluteString)
                Header : \(request.allHTTPHeaderFields!)
                Body :
                    \(String(bytes:request.httpBody ?? Data() , encoding: .utf8) ?? "")

            """)
        
        self.session.dataTask(with: self.request) { (responseData, urlResponse, error) in
            guard error == nil else {
                ERROR_LOG(error!)
                onCompletion(.failure(error!))
                return
            }
            
            if let data = responseData, let urlResponse = urlResponse as? HTTPURLResponse{
                DEBUG_LOG(
                    """
                    
                    ---------------Response--------------
                    statusCode : \(urlResponse.statusCode)
                    body:
                    \(String(bytes: data, encoding: .utf8) ?? "")
                    
                    """)
                onCompletion(.success(Response(data: data, statusCode: urlResponse.statusCode)))
            }else if let urlResponse = urlResponse as? HTTPURLResponse{
                onCompletion(.success(Response(data: nil, statusCode: urlResponse.statusCode)))
            }else{
                onCompletion(.failure(NSError(domain: "HttpRequest.request", code: 0, userInfo: ["Description" : "unknown error"])))
            }
        }.resume()
    }
    
}
