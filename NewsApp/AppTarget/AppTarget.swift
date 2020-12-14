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
    case withDraw(bankAccount:String,amount:Int,name:String)
    case getAllVouchers
    case like(id:Int,comment:String,photo:UIImage,rate:Int)
    case share(id:Int)
    case wallet
    case verifyCustomerNumber(number:String)
    case setCustomerNumberAmount(number:String,voucherID:Int)
    case updateProfile(first: String, last: String, email: String,current:String)
    case Home
    case MyStores
    case listStoreReviews(id:Int)
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
        case .MyStores:
            return AppTargetConstant.EndPoint.myStores
        case .withDraw:
            return AppTargetConstant.EndPoint.withdraw
        case .getAllVouchers :
            return AppTargetConstant.EndPoint.vouchers
        case .like:
            return AppTargetConstant.EndPoint.like
        case .share:
            return AppTargetConstant.EndPoint.share
        case .updateProfile:
            return AppTargetConstant.EndPoint.updateProfile
        case .wallet:
            return AppTargetConstant.EndPoint.wallet
        case .verifyCustomerNumber:
            return AppTargetConstant.EndPoint.verifyCustomerNumberAmount
        case .setCustomerNumberAmount:
            return AppTargetConstant.EndPoint.setCustomerNumberAmount
        case .Home:
            return AppTargetConstant.EndPoint.home
        case .listStoreReviews(let id):
            return "\(AppTargetConstant.EndPoint.listStoreReviews)/\(id)"
        }
    }
    
    
    var sampleData: Data {
        return Data()
    }
    
    var method: Moya.Method{
        switch self {
        case .wallet,.getAllVouchers,.Home,.MyStores,.listStoreReviews:
            return .get
        case .verifyCustomerNumber,.setCustomerNumberAmount,.updateProfile,.share,.like, .withDraw:
            return .post
        }
    }
    
    var task: Task {
        switch self {
            case  .withDraw(let bankAccount,let amount,let name):
                let parameters: [String: Any] = [AppTargetConstant.Parameters.bankAccount: bankAccount,
                                                           AppTargetConstant.Parameters.amount: amount,
                                                           AppTargetConstant.Parameters.fullName: name
                          ]
                          return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .like(let id,let comment , let photo,let rate):

            let imageData = photo.jpegData(compressionQuality: 0.5)
            
            var formData: [Moya.MultipartFormData] = [Moya.MultipartFormData(provider: .data(imageData!), name: AppTargetConstant.Parameters.photo, fileName: "photo.png", mimeType: "image/png")]
            formData.append(MultipartFormData(provider: .data("\(id)".data(using: .utf8)!), name: AppTargetConstant.Parameters.walletId))
            formData.append(MultipartFormData(provider: .data(comment.data(using: .utf8)!), name: AppTargetConstant.Parameters.comment))
            formData.append(MultipartFormData(provider: .data("\(rate)".data(using: .utf8)!), name: AppTargetConstant.Parameters.rate))

            return .uploadMultipart(formData)
            
        case .share(let id):
            let parameters: [String: Any] = [AppTargetConstant.Parameters.walletId: id ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case .wallet,.getAllVouchers:
            return .requestPlain
        case .updateProfile(let first, let last, let email,let current):
            let parameters: [String: Any] = [AppTargetConstant.Parameters.email: email,
                                             AppTargetConstant.Parameters.firstName: first,
                                             AppTargetConstant.Parameters.currentPass: current,
                                             AppTargetConstant.Parameters.lastName: last
            ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case .setCustomerNumberAmount(let number, let voucherId):
            let parameters: [String: Any] = [AppTargetConstant.Parameters.customerNumber: number,
                                             AppTargetConstant.Parameters.voucher_id: voucherId,
            ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case .verifyCustomerNumber(let number):
            let parameters: [String: Any] = [AppTargetConstant.Parameters.customerNumber: number]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case .Home,.MyStores:
            return .requestPlain
        case .listStoreReviews:
            return .requestPlain
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
