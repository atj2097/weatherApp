//
//  FavView.swift
//  weatherApp
//
//  Created by God on 10/15/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

class FavView: UIView {
    //UI Elements
    let favoriteWeather: UITableView = {
        let favoriteWeather = UITableView()
        favoriteWeather.backgroundColor = .red
        return favoriteWeather
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func commonInit() {
        addSubview(favoriteWeather)
        setConstraints()
    }
    
    //Constraints
    private func setConstraints() {
        [favoriteWeather.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor), favoriteWeather.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor), favoriteWeather.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor), favoriteWeather.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)].forEach({$0.isActive = true})
        
    }
}
