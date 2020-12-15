//
//  AppTargetConstant.swift
//  Coins
//
//  Created by Mena Gamal on 7/26/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation

//https://newsapi.org/v2/sources?language=en&country=us&apiKey=d61459448d394cc495267faf0785baf3

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
        static let articles = "top-headlines"
    }
    
    enum Parameters{
        static let language = "language"
        static let country = "country"
        static let apiKey = "apiKey"

    }
    
}
struct CountryModel {
    var title = ""
    var id = ""
}
