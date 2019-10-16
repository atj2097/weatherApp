//
//  WeatherViewController.swift
//  weatherApp
//
//  Created by God on 10/15/19.
//  Copyright © 2019 God. All rights reserved.
//
//TO DO: Fully Set Up All Functionalities of View Controller

import UIKit

class WeatherViewController: UIViewController {
    var weatherView = WeatherView()
    var weatherArray = [DailyDatum]() {
        didSet {
            weatherView.weatherCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherView.backgroundColor = .white
        loadData()
        addViews()
        //Setting Up Collection View
        weatherView.weatherCollectionView.dataSource = self
        weatherView.weatherCollectionView.delegate = self
        let nib = UINib(nibName: "WeatherCell", bundle: nil)
        weatherView.weatherCollectionView.register(nib, forCellWithReuseIdentifier: "weatherCell")
        dump(weatherArray)
    }
    
    private func addViews() {
        self.view.addSubview(weatherView)
    }
    
    func loadData() {
        WeatherAPIManager.shared.getWeather(completionHandler: {(result) in
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
}

extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = weatherView.weatherCollectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        let currentWeather = weatherArray[indexPath.row]
        let date = NSDate(timeIntervalSince1970: TimeInterval(currentWeather.time))
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
        cell.highTemp.text = "\(currentWeather.temperatureHigh)"
        cell.lowTemp.text = "\(currentWeather.temperatureLow)"
        //get date from time NSDATE
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           let weatherForecast = weatherArray[indexPath.row]
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "WeatherView") as! DetailViewController
            nextViewController.weather = weatherForecast
            self.present(nextViewController, animated:true, completion:nil)
    }
    
    
}
