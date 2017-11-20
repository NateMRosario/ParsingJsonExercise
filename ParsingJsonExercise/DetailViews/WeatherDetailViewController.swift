//
//  WeatherDetailViewController.swift
//  ParsingJsonExercise
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    var Location: Weather?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var humidLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
    }

    func updateData() {
        if let weather = Location {
            nameLabel.text = weather.name
            tempLabel.text = "\(weather.main.temp * 9/5 + 32) \u{2109}"
            mainLabel.text = weather.weather[0].main
            humidLabel.text = "Humidity: \(weather.main.humidity)%"
            
        }
    }


}
