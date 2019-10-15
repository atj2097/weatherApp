//
//  WeatherViewController.swift
//  weatherApp
//
//  Created by God on 10/15/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    var weatherView = WeatherView()

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherView.backgroundColor = .white
        addViews()
        // Do any additional setup after loading the view.
    }
    
    func addViews() {
        self.view.addSubview(weatherView)
    }
    

    

}
