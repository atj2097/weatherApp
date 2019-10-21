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
        let urlStr = "https://api.darksky.net/forecast/6/\(lat),\(long)"
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
