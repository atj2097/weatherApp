//
//  WeatherFetchingServiced.swift
//  weatherApp
//
//  Created by God on 10/15/19.
//  Copyright © 2019 God. All rights reserved.
//

import Foundation

class WeatherAPIManager {
    private init() {}

    static let shared = WeatherAPIManager()
    static let longitude = ""
    static let latitude = ""
    func getWeather(long: Double, lat: Double, completionHandler: @escaping (Result<[DailyDatum], AppError>) -> Void) {
        let urlStr = "https://api.darksky.net/forecast/2978fe7f2c818ac20f5f87f0591a3d3d/\(long),\(lat)"
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
                    let weatherWrapper = try JSONDecoder().decode(Weather.self, from: data)
                    completionHandler(.success(weatherWrapper.daily.data))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}


//import Foundation
//
//class (apiName)APIManager {
//    private init() {}
//
//    static let shared = (apiName)APIManager()
//
//    func get(name)(searchWord: String, completionHandler: @escaping (Result<[(name)], AppError>) -> Void) {
//        let urlStr = ""
//        guard let url = URL(string: urlStr) else {
//            completionHandler(.failure(.badURL))
//            return
//        }
//
//
//        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
//            switch result {
//            case .failure(let error) :
//                completionHandler(.failure(error))
//            case .success(let data):
//                do {
//                    let (name)Info = try JSONDecoder().decode((name)Info.self, from: data)
//                    completionHandler(.success((name)Info.results))
//                } catch {
//                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
//                }
//            }
//        }
//    }
//
//
//    func postPodcast((elementName)): (insertName), completionHandler: @escaping (Result<Data, AppError>) -> Void) {
//        let (name)Wrapper = (name)Info(results: [(name)])
//        guard let encodedData = try? JSONEncoder().encode((nameWrapper)) else {
//            fatalError("encoder failed")
//        }
//        let urlStr = ""
//        guard let url = URL(string: urlStr) else {
//            completionHandler(.failure(.badURL))
//            return
//        }
//        NetworkHelper.manager.performDataTask(withUrl: url, andHTTPBody: encodedData, andMethod: .post) { (result) in
//            switch result {
//            case .success(let data):
//                completionHandler(.success(data))
//            case .failure(let error) :
//                completionHandler(.failure(error))
//            }
//        }
//
//    }
//
//}
//
