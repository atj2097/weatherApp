//
//  DetailView.swift
//  weatherApp
//
//  Created by God on 10/16/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

class DetailView: UIView {
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var weatherDescription: UITextView!
    @IBAction func saveCity(_ sender: UIButton) {

    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    //Constraints


}
