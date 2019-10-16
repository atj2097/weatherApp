//
//  ImageHelper.swift
//  weatherApp
//
//  Created by God on 10/16/19.
//  Copyright © 2019 God. All rights reserved.
//

import Foundation

import Foundation
struct ImagePersistenceManager {
    private init() {}
    static let manager = ImagePersistenceManager()
    
    
    private let persistenceHelper = PersistenceHelper<Hit>(fileName: "image.plist")
    
    
    func saveImage(image: Hit) throws {
        try persistenceHelper.save(newElement: image)
        
    }
    
    func getImages() throws -> [Hit] {
        return try persistenceHelper.getObjects()
    }
    
}
