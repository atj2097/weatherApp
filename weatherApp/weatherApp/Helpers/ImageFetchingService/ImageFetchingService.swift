//
//  ImageFetchingService.swift
//  weatherApp
//
//  Created by God on 10/15/19.
//  Copyright © 2019 God. All rights reserved.
//

import Foundation
//class ImageAPIManager {
//    private init() {}
//
//    static let shared = ImageAPIManager()
//    static let longLatitude = ""
//    static  func getWeather(ifSearching: String, completionHandler: @escaping (Result<[Weather], AppError>) -> Void) {
//        let urlStr = "https://api.darksky.net/forecast/\(weatherAPIKey)/\(longLatitude)"
//        guard let url = URL(string: urlStr) else {
//            completionHandler(.failure(.badURL))
//            return
//        }
//
//        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
//            switch result {
//            case .failure(let error) :
//                completionHandler(.failure(error))
//            case .success(let data):
//                do {
//                    let weatherWrapper = try JSONDecoder().decode([Weather].self, from: data)
//                    completionHandler(.success(weatherWrapper))
//                } catch {
//                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
//                }
//            }
//        }
//    }
//}
