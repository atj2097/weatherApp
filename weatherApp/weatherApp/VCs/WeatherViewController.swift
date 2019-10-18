//
//  WeatherViewController.swift
//  weatherApp
//
//  Created by God on 10/15/19.
//  Copyright © 2019 God. All rights reserved.
//
//TO DO: See why app is crashing when assigning labels
//TO DO: Add text input delegates

import UIKit

class WeatherViewController: UIViewController {
    var weatherView = WeatherView()
    var cityImage = UIImage()
    var cityName = String()
    var weatherArray = [DailyDatum]() {
        didSet {
            weatherView.weatherCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherView.backgroundColor = .clear
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "27-Clouds-iPhone-Wallpapers-by-Preppy-Wallpapers"))
        
        addViews()
        //Setting Up Collection View
        weatherView.weatherCollectionView.dataSource = self
        weatherView.weatherCollectionView.delegate = self
        weatherView.enterZipCode.delegate = self
        let nib = UINib(nibName: "WeatherCell", bundle: nil)
        weatherView.weatherCollectionView.register(nib, forCellWithReuseIdentifier: "weatherCell")
        dump(weatherArray)
    }
    
    private func addViews() {
        self.view.addSubview(weatherView)
    }
    
    
}
extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = weatherView.weatherCollectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        cell.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        let currentWeather = weatherArray[indexPath.row]
        let date = NSDate(timeIntervalSince1970: TimeInterval(currentWeather.time!))
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: date as Date) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MMM-yyyy"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        
        cell.dateOfTheWeek.text = myStringafd
        cell.weatherImage.image = UIImage(named: "\(currentWeather.icon)")
        cell.highTemp.text = "\(currentWeather.temperatureHigh!)"
        cell.lowTemp.text = currentWeather.temperatureLow?.description
        //get date from time NSDATE
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let weatherForecast = weatherArray[indexPath.row]
        let nextViewController = DetailViewController()
        nextViewController.weather = weatherForecast
        nextViewController.cityImage = cityImage
        nextViewController.cityName = cityName
        self.present(nextViewController, animated: true, completion: nil)
    }
}
extension WeatherViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ZipCodeHelper.getLatLong(fromZipCode: textField.text!, completionHandler: {(result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    print(success)
                    self.weatherView.weatherCityLabel.text = "Weather For \(success.2)"
                    self.cityName = success.2
                    DispatchQueue.global().async {
                    
                    WeatherAPIManager.shared.getWeather(long: success.long, lat: success.lat, completionHandler: {(result) in
                        DispatchQueue.main.async {
                            switch result{
                            case .success(let weather):
                                self.weatherArray = weather
                            case .failure(let error):
                                print(error)
                            }
                        }
                    })
                    }
                    self.weatherView.weatherCollectionView.reloadData()
                    ImageAPIManager.getImages(city: success.name.lowercased().replacingOccurrences(of: " ", with: "+"), completionHandler: {(result) in
                        switch result{
                        case .success(let success):
                            let url = URL(string:success.randomElement()?.largeImageURL ?? "")
                            dump(url)
                            if url != nil {
                                if let data = try? Data(contentsOf: url!)
                                {
                                UIGraphicsBeginImageContext(self.view.frame.size)
                                    UIImage(data: data)?.draw(in: self.view.bounds)
                                    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
                                    UIGraphicsEndImageContext()
                                    self.view.backgroundColor = UIColor(patternImage: image)
                                    self.cityImage = image
                                    
                                }
                            } else {
                                self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "27-Clouds-iPhone-Wallpapers-by-Preppy-Wallpapers"))
                            }
                        
                            
                        case.failure(let error):
                            print(error)
                        }
                        
                    })
                case .failure(let error):
                    print(error)
                }
            }
        })
        return true
    }
    
    
}



