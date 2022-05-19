//
//  Weather.swift
//  WeatherApp
//
//  Created by Mahbubur Rashid Leon on 19/5/22.
//

import Foundation

struct WeatherResponse: Decodable {
    var main: Weather?
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
