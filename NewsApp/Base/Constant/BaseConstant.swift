//
//  BaseConstant.swift
//  Customer
//
//  Created by CARNVAL on 5/20/20.
//  Copyright © 2020 waqood. All rights reserved.
//

import Foundation

enum BaseConstant {
    
    // Production https://dev.waqood.xyz/alborg/api/customer/
    // Development https://dev.waqood.xyz/alborg/api/customer/
    
    static let baseUrl = "https://newsapi.org/v2/"
    
    enum Codes: Int {
        case success = 200
        case failure = 404
        case unAuthorized = 401
    }
    
     enum HTTPHeaderField: String {
        case ContentType = "Content-Type"
        case Accept = "Accept"
        case AcceptLanguage = "Accept-Language"
        case Authorization = "Authorization"
    }
    
     enum ContentType :String{
        case json = "application/json"
        case multiPart = "application/x-www-form-urlencoded"
    }
    
    
    
    struct HTTPHeaders {
        static let def: [String: String] = [
            BaseConstant.HTTPHeaderField.Accept.rawValue: BaseConstant.ContentType.json.rawValue,
            BaseConstant.HTTPHeaderField.ContentType.rawValue: BaseConstant.ContentType.json.rawValue]
        
    
        static var token = UserDefaultsHandler().getUserToken()
        static let authorized: [String: String] = [
            
            BaseConstant.HTTPHeaderField.Accept.rawValue: BaseConstant.ContentType.json.rawValue,
            BaseConstant.HTTPHeaderField.ContentType.rawValue: BaseConstant.ContentType.json.rawValue,
            BaseConstant.HTTPHeaderField.Authorization.rawValue: "Bearer \(HTTPHeaders.token)"]
        static let authorizedMultiPart: [String: String] = [
         
            BaseConstant.HTTPHeaderField.Accept.rawValue: BaseConstant.ContentType.json.rawValue,
            BaseConstant.HTTPHeaderField.ContentType.rawValue: BaseConstant.ContentType.multiPart.rawValue]
    }
    
}


var deviceToken: String{
    if let deviceToken = UserDefaults.standard.value(forKey: "fcmToken") as? String {
        return deviceToken
    }
    return ""
}

