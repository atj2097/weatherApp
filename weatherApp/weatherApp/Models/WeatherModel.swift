//
//  WeatherModel.swift
//  weatherApp
//
//  Created by God on 10/15/19.
//  Copyright © 2019 God. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try? newJSONDecoder().decode(Weather.self, from: jsonData)

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let daily: Daily

}


// MARK: - Daily
struct Daily: Codable {
    let data: [DailyDatum]
}

// MARK: - DailyDatum
struct DailyDatum: Codable {
    let icon: String
    let temperatureHigh: Double
    let temperatureLow: Double
    let windSpeed: Double
    let precipIntensityMax: Double
    let time: Int
    let sunriseTime: Int
    let sunsetTime: Int
}

