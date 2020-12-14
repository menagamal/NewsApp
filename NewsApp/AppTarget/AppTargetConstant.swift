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
//        CountryModel(title: "", id: "id") ,
//        CountryModel(title: "", id: "ie") ,
//        CountryModel(title: "", id: "il") ,
//        CountryModel(title: "", id: "in") ,
//        CountryModel(title: "", id: "it") ,
//        CountryModel(title: "", id: "jp") ,
//        CountryModel(title: "", id: "kr") ,
//        CountryModel(title: "", id: "lt") ,
//        CountryModel(title: "", id: "lv") ,
//        CountryModel(title: "", id: "ma") ,
//        CountryModel(title: "", id: "mx") ,
//        CountryModel(title: "", id: "my") ,
//        CountryModel(title: "", id: "ng") ,
//        CountryModel(title: "", id: "nl") ,
//        CountryModel(title: "", id: "no") ,
//        CountryModel(title: "", id: "nz") ,
//        CountryModel(title: "", id: "ph") ,
//        CountryModel(title: "", id: "pl") ,
//        CountryModel(title: "", id: "pt") ,
//        CountryModel(title: "", id: "ro") ,
//        CountryModel(title: "", id: "rs") ,
//        CountryModel(title: "", id: "ru") ,
//        CountryModel(title: "", id: "sa") ,
//        CountryModel(title: "", id: "se") ,
//        CountryModel(title: "", id: "sg") ,
//        CountryModel(title: "", id: "si") ,
//        CountryModel(title: "", id: "sk") ,
//        CountryModel(title: "", id: "th") ,
//        CountryModel(title: "", id: "tr") ,
//        CountryModel(title: "", id: "tw") ,
//        CountryModel(title: "", id: "ua") ,
//        CountryModel(title: "", id: "us") ,
//        CountryModel(title: "", id: "ve") ,
//        CountryModel(title: "", id: "za")
    ]
    
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
