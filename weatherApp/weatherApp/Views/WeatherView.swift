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
        let weatherCityLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        weatherCityLabel.textColor = .black
        weatherCityLabel.text = "Welcome To The Weather App"
        weatherCityLabel.textAlignment = .center
        return weatherCityLabel
    }()
    
    let weatherCollectionView: UICollectionView = {
        let weatherView = UICollectionView(frame:.zero, collectionViewLayout: UICollectionViewLayout.init())
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        weatherView.setCollectionViewLayout(layout, animated: true)
        weatherView.backgroundColor = .clear
        return weatherView
    }()
    
    let enterZipCode: UITextField = {
        let enterZipCode = UITextField(frame: .zero)
        enterZipCode.borderStyle = UITextField.BorderStyle.line
        enterZipCode.textAlignment = .center
        enterZipCode.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        enterZipCode.backgroundColor = UIColor.white
        return enterZipCode
    }()
    
    let zipCodeText: UILabel = {
        let zipCodeText = UILabel(frame: .zero)
        zipCodeText.backgroundColor = .white
        zipCodeText.text = "Enter Your Zip Code"
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
        addSubview(weatherCollectionView)
        addSubview(enterZipCode)
        addSubview(zipCodeText)
        setConstraints()
    }
    
    //Constraints
    private func setConstraints() {
        //Weather Label
        weatherCityLabel.translatesAutoresizingMaskIntoConstraints = false
        [weatherCityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),weatherCityLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)].forEach({$0.isActive = true })
    
        
        //Collection View
        weatherCollectionView.translatesAutoresizingMaskIntoConstraints = false
        [weatherCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),weatherCollectionView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),weatherCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -300), weatherCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),weatherCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0)].forEach({$0.isActive = true})
        //Input Zip Code
        enterZipCode.translatesAutoresizingMaskIntoConstraints = false
        [enterZipCode.topAnchor.constraint(equalTo: weatherCollectionView.bottomAnchor, constant: 50), enterZipCode.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor), enterZipCode.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 10), enterZipCode.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),enterZipCode.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -200)].forEach({$0.isActive = true})
        
//        //ZipLabel
        zipCodeText.translatesAutoresizingMaskIntoConstraints = false
        [zipCodeText.topAnchor.constraint(equalTo: enterZipCode.bottomAnchor, constant: 20), zipCodeText.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)].forEach({$0.isActive = true})
   }
    
    
}

