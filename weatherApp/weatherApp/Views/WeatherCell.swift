//
//  WeatherCell.swift
//  weatherApp
//
//  Created by God on 10/15/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    @IBOutlet weak var dateOfTheWeek: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
