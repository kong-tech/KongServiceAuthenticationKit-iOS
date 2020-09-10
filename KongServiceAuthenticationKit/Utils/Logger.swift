//
//  Logger.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/01.
//  Copyright © 2020 KONGTech. All rights reserved.
//

import  Foundation

func DEBUG_LOG(_ msg:Any, file:String = #file, function:String = #function, line:Int = #line){
    
    #if DEBUG
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm:ss"
    
    let fileName = file.split(separator: "/").last ?? ""
    let funcName = function.split(separator: "(").first ?? ""
    print("🤨 [\(formatter.string(from: Date()))][\(fileName) \(funcName)(\(line)): \(msg)]")
    
    #endif
}

func ERROR_LOG(_ msg:Any, file:String = #file, function:String = #function, line:Int = #line){
    
    #if DEBUG
    
    let fileName = file.split(separator: "/").last ?? ""
    let funcName = function.split(separator: "(").first ?? ""
    print("🕸 [\(fileName) \(funcName)(\(line)): \(msg)]")
    
    #endif
}
