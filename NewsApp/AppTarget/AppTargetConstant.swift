//
//  AppTargetConstant.swift
//  Coins
//
//  Created by Mena Gamal on 7/26/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation

enum AppTargetConstant {
    
    enum EndPoint {
        
        static let wallet = "customer/wallet"
        static let verifyCustomerNumberAmount = "business/issue/verify-customer-number"
        static let setCustomerNumberAmount = "business/issue/amount"
        static let updateProfile = "auth/profile"
        static let share = "customer/share"
        static let like = "customer/review"
        static let vouchers = "business/vouchers"
        static let withdraw = "customer/withdraw"
        static let home = "customer/home"
        static let myStores = "customer/listStores"
        static let listStoreReviews = "customer/listStoreReviews"
    }
    
    enum Parameters {
        static let customerNumber = "customerNumber"
        static let voucher_id = "voucher_id"
        static let firstName = "first_name"
        static let lastName = "last_name"
        static let email = "email"
        static let currentPass = "current_password"
        static let walletId = "wallet_id"
        static let bankAccount = "bank_account"
        static let amount = "amount"
        static let fullName = "full_name"
        static let comment = "comment"
        static let photo = "photo"
        static let rate = "rate"
    }
    
    
}
