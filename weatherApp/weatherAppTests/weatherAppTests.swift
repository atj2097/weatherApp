//
//  weatherAppTests.swift
//  weatherAppTests
//
//  Created by God on 10/15/19.
//  Copyright © 2019 God. All rights reserved.
//

import XCTest
@testable import weatherApp

class Weather_App_ProgrammaticTests: XCTestCase {
    
    func testLoadWeather () {
        let data = weatherTest()
        
        let weather = Weather.getWeatherDataTest(from: data)
        XCTAssert(weather.count != 0)
    }

    private func weatherTest() -> Data {
        //let bundle = Bundle(for: type(of: self))
        guard let pathToData = Bundle.main.path(forResource: "weatherJSON", ofType: "json")  else {
            XCTFail("error deparsing")
       return Data()
            
        }
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let error {
            fatalError("couldn't find data \(error)")
        }
    }
    
}
