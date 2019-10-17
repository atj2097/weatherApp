//
//  detailViewController.swift
//  weatherApp
//
//  Created by God on 10/16/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var cityImage = UIImage()
    var cityName = String()
    lazy var cityLabel: UILabel = {
        var citylabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        citylabel.textColor = .black
        citylabel.font = UIFont(name: "Arial-BoldItalicMT", size: 40)
        citylabel.textAlignment = .center
        return citylabel
    }()
    lazy var imageView: UIImageView = {
        var cityImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return cityImage
    }()
    
    lazy var tempHigh: UILabel = {
        let tempHigh = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tempHigh.textColor = .black
        tempHigh.textAlignment = .center
        return tempHigh
    }()
    
    lazy var tempLow: UILabel = {
        let tempLow = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tempLow.textColor = .black
        tempLow.textAlignment = .center
        return tempLow
    }()
    
    lazy var imageForecast: UIImageView = {
        var forecastImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        return forecastImage
    }()
    
    
    var weather: DailyDatum!
        
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "12-Clouds-iPhone-Wallpapers-by-Preppy-Wallpapers"))
        self.view.addSubview(cityLabel)
        self.view.addSubview(imageView)
        self.view.addSubview(tempHigh)
        self.view.addSubview(tempLow)
        self.view.addSubview(imageForecast)
        cityLabel.text = cityName
        imageView.image = cityImage
        imageForecast.image = UIImage(named: weather.icon)
        if imageView.image == nil {
            imageView.image = #imageLiteral(resourceName: "no-image-available-icon-6")
        }
        tempHigh.text = "High Temp: \(weather.temperatureHigh?.description ?? "")"
        tempLow.text = "Low Temp: \(weather.temperatureLow?.description ?? "")"
        setUpConstraints()
        // Do any additional setup after loading the view.
    }
    private func setUpConstraints() {
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        [cityLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),cityLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)].forEach({$0.isActive = true })
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
        [imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -400), imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0)].forEach({$0.isActive = true})
        
    imageForecast.translatesAutoresizingMaskIntoConstraints = false
        [imageForecast.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50), imageForecast.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor, constant: 20)].forEach({$0.isActive = true})
        
        tempHigh.translatesAutoresizingMaskIntoConstraints = false
        [tempHigh.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),tempHigh.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)].forEach({$0.isActive = true})
        
        tempLow.translatesAutoresizingMaskIntoConstraints = false
        [tempLow.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),tempLow.topAnchor.constraint(equalTo: tempHigh.bottomAnchor, constant: 20)].forEach({$0.isActive = true})
        
    }
}
