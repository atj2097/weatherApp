//
//  UserDefaults.swift
//  weatherApp
//
//  Created by God on 10/15/19.
//  Copyright © 2019 God. All rights reserved.
//
import Foundation
import UIKit
class UserDefaultsWrapper {
    
    // MARK: - Static Properties
    
    static let manager = UserDefaultsWrapper()
    
    // MARK: - Internal Methods
    
    //STORE
    func storeLastZipCode(zipCode: String) {
        UserDefaults.standard.set(zipCode, forKey: lastZipCode)
    }
    
    //GET
    func getlastZipCode() -> String? {
        return UserDefaults.standard.value(forKey: lastZipCode) as? String ?? ""
    }
 
    // MARK: - Private inits and properties
    
    private init() {}

    private let lastZipCode = "lastZipCode"
}
