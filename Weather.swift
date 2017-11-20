//
//  Weather.swift
//  ParsingJsonExercise
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import Foundation

struct WeatherInfo: Codable {
    var list: [Weather]
}

struct Weather: Codable {
    var name: String
    var main: MainWrapper
    var weather: [WeatherWrapper]
}

struct MainWrapper: Codable {
    var temp: Double
    var humidity: Int
}

struct WeatherWrapper: Codable {
    var main: String
}
