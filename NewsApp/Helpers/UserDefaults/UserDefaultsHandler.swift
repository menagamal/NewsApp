//
//  UserDefaultsHandler.swift
//  Coins
//
//  Created by Mena Gamal on 7/26/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import Foundation

class UserDefaultsHandler {
    
    enum Settings : String {
        case IsLoggedIn, UserToken , User, Country,Categories
        
    }
    
    var userDefault: UserDefaults
    
    init() {
        userDefault = UserDefaults.standard
    }
    
    
    func setCountry(value:String)  {
        let _ =  save(object: value, setting: Settings.Country)
    }
    
    func getCountry()  -> String {
        if let object = userDefault.object(forKey: Settings.Country.rawValue) {
            return object as! String
        }
        return ""
    }
    
    
    func setCategories(value:[String])  {
        let _ =  save(object: value, setting: Settings.Categories)
    }
    func getCategories()  -> [String] {
        if let object = userDefault.object(forKey: Settings.Categories.rawValue) {
            return object as! [String]
        }
        return [String]()
    }
    
    
    func setUserToken(value:String)  {
        let _ =  save(object: value, setting: Settings.UserToken)
    }
    
    func setLoggedIn(value:Bool) {
      
        let _ = save(object: value, setting: Settings.IsLoggedIn)
    }
    
    func resetAccount() {
        setLoggedIn(value: false)
        setUserToken(value: "");
    }
    
    
    
    func isLoggedIn() -> Bool {
        if let object = userDefault.object(forKey: Settings.IsLoggedIn.rawValue) {
            return object as! Bool
        }
        return false
    }
    
    func getUserToken()  -> String {
        if let object = userDefault.object(forKey: Settings.UserToken.rawValue) {
            return object as! String
        }
        return ""
    }
    
    
    private func save(object: Any, setting: Settings) -> Bool {
        if (object is Int) {
            userDefault.set(object as! Int, forKey: setting.rawValue)
        } else if (object is Bool) {
            userDefault.set(object as! Bool, forKey: setting.rawValue)
        } else if (object is String) {
            userDefault.set(object as! String, forKey: setting.rawValue)
        } else {
            userDefault.set(object, forKey: setting.rawValue)
        }
        
        return userDefault.synchronize()
    }
    
}
