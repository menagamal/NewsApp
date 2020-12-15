//
//  AppTarget.swift
//  Coins
//
//  Created by Mena Gamal on 7/26/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import Moya


enum AppTarget {
    case articles
}

extension AppTarget: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: BaseConstant.baseUrl) else {
            preconditionFailure("Invalid url")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .articles:
            return AppTargetConstant.EndPoint.articles
        }
    }
    
    
    var sampleData: Data {
        return Data()
    }
    
    var method: Moya.Method{
        switch self {
        case .articles:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case  .articles:
            let parameters: [String: Any] = [AppTargetConstant.Parameters.language: "en",
                                             AppTargetConstant.Parameters.country: "us",
                                             AppTargetConstant.Parameters.apiKey: AppTargetConstant.Keys.apiKey
            ]
            
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
            
        }
    }
    
    var headers: [String : String]? {
        let token = UserDefaultsHandler().getUserToken()
        let authorized: [String: String] = [
            
            BaseConstant.HTTPHeaderField.Accept.rawValue: BaseConstant.ContentType.json.rawValue,
            BaseConstant.HTTPHeaderField.ContentType.rawValue: BaseConstant.ContentType.json.rawValue,
            BaseConstant.HTTPHeaderField.Authorization.rawValue: "Bearer \(token)"]
        return authorized
    }
    
}
