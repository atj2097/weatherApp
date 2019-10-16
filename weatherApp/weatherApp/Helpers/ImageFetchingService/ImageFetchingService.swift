//
//  ImageFetchingService.swift
//  weatherApp
//
//  Created by God on 10/15/19.
//  Copyright © 2019 God. All rights reserved.
//

import Foundation


class ImageAPIManager {
    private init() {}
    
    static let shared = ImageAPIManager()
    static  func getImages(city: String, completionHandler: @escaping (Result<[Hit], AppError>) -> Void) {
        let urlStr = "https://pixabay.com/api/?key=13804220-31078e62f469c96f42932130a&q=\(city)&image_type=photo&pretty=true"
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error) :
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let imageWrapper = try JSONDecoder().decode(ImageWrapper.self, from: data)
                    completionHandler(.success(imageWrapper.hits))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}
