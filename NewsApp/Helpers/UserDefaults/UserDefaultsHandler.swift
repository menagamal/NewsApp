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
        case IsLoggedIn, UserToken , User
        
    }
    
    var userDefault: UserDefaults
    
    init() {
        userDefault = UserDefaults.standard
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
