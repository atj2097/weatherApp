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
    
    let weatherCollectionView: UICollectionView = {
        let weatherView = UICollectionView(frame:CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewLayout.init())
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
        addSubview(weatherCollectionView)
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
        weatherCollectionView.translatesAutoresizingMaskIntoConstraints = false
        [weatherCollectionView.topAnchor.constraint(equalTo: weatherCityLabel.bottomAnchor, constant: 50), weatherCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), weatherCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 250), weatherCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 500)].forEach({$0.isActive = true})
        //Input Zip Code
        enterZipCode.translatesAutoresizingMaskIntoConstraints = false
        [enterZipCode.topAnchor.constraint(equalTo: weatherCollectionView.bottomAnchor, constant: 0), enterZipCode.bottomAnchor.constraint(equalTo: zipCodeText.topAnchor, constant: 10), enterZipCode.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 200)].forEach({$0.isActive = true})
        //ZipLabel
        zipCodeText.translatesAutoresizingMaskIntoConstraints = false
        [zipCodeText.topAnchor.constraint(equalTo: enterZipCode.bottomAnchor), enterZipCode.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 250)].forEach({$0.isActive = true})
    }
    
    
}
