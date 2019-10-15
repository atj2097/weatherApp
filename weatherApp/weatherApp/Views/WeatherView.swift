//
//  WeatherView.swift
//  weatherApp
//
//  Created by God on 10/15/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

class WeatherView: UIView {
    
    //UI ELEMENTS
    let weatherCityLabel: UILabel = {
        let weatherCityLabel = UILabel()
        weatherCityLabel.textColor = .black
        return weatherCityLabel
    }()
    
    let weatherView: UICollectionView = {
        let weatherView = UICollectionView(frame: CGRect(x: 200, y: 200, width: 300, height: 400), collectionViewLayout: UICollectionViewLayout.init())
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        weatherView.setCollectionViewLayout(layout, animated: true)
        weatherView.backgroundColor = .black
        return weatherView
    }()
    
    let enterZipCode: UITextField = {
        let enterZipCode = UITextField()
        return enterZipCode
    }()
    
    let zipCodeText: UILabel = {
        let zipCodeText = UILabel()
        zipCodeText.backgroundColor = .black
        zipCodeText.text = "Enter Your Zipe Code"
        return zipCodeText
    }()
    
    //Initilizer Funcs
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func commonInit() {
        addSubview(weatherCityLabel)
        addSubview(weatherView)
        addSubview(enterZipCode)
        addSubview(zipCodeText)
        setConstraints()
    }
    
    //Constraints
    private func setConstraints() {
        //Weather Label
        weatherCityLabel.translatesAutoresizingMaskIntoConstraints = false
        [weatherCityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100), weatherCityLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 250)].forEach({$0.isActive = true })
        //Collection View
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        [weatherView.topAnchor.constraint(equalTo: weatherCityLabel.bottomAnchor, constant: 50), weatherView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 250), weatherView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 250), weatherView.bottomAnchor.constraint(equalTo: enterZipCode.topAnchor, constant: 20)].forEach({$0.isActive = true})
        //Input Zip Code
        enterZipCode.translatesAutoresizingMaskIntoConstraints = false
        [enterZipCode.topAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: 0), enterZipCode.bottomAnchor.constraint(equalTo: zipCodeText.topAnchor, constant: 10), enterZipCode.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 200)].forEach({$0.isActive = true})
        //ZipLabel
        zipCodeText.translatesAutoresizingMaskIntoConstraints = false
        [zipCodeText.topAnchor.constraint(equalTo: enterZipCode.bottomAnchor), enterZipCode.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 250)].forEach({$0.isActive = true})
    }
    
    
}
