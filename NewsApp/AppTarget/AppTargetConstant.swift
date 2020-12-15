//
//  AppTargetConstant.swift
//  Coins
//
//  Created by Mena Gamal on 7/26/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation

enum AppTargetConstant {
    enum Keys {
        static let apiKey = "d61459448d394cc495267faf0785baf3"
    }
    
    static let Categories: [CountryModel] = [
        CountryModel(title: "business", id: "") ,
        CountryModel(title: "entertainment", id: "") ,
        CountryModel(title: "general", id: "") ,
        CountryModel(title: "health", id: "") ,
        CountryModel(title: "science", id: "") ,
        CountryModel(title: "sports", id: "") ,
        CountryModel(title: "technology", id: "")
    ]
    
    static let Countries: [CountryModel] = [
        CountryModel(title: "United Arab Emirates", id: "ae") ,
        CountryModel(title: "Argentina", id: "ar") ,
        CountryModel(title: "Austria", id: "at") ,
        CountryModel(title: "Belgium", id: "be") ,
        CountryModel(title: "Bulgaria", id: "bg") ,
        CountryModel(title: "Brazil", id: "br") ,
        CountryModel(title: "Canada", id: "ca") ,
        CountryModel(title: "Chile", id: "ch") ,
        CountryModel(title: "China", id: "cn") ,
        CountryModel(title: "Colombia", id: "co") ,
        CountryModel(title: "Cuba", id: "cu") ,
        CountryModel(title: "Czech", id: "cz") ,
        CountryModel(title: "Denmark", id: "de") ,
        CountryModel(title: "Egypt", id: "eg") ,
        CountryModel(title: "France", id: "fr") ,
        CountryModel(title: "United Kingdom", id: "gb") ,
        CountryModel(title: "Germany", id: "gr") ,
        CountryModel(title: "Hungry", id: "hu")
    ]
    
    enum UserDefaultsKeys {
        static let country = "country"
        static let categories = "categories"
    }
    
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
struct CountryModel {
    var title = ""
    var id = ""
}
