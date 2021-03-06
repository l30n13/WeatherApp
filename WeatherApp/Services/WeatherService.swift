//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Mahbubur Rashid Leon on 19/5/22.
//

import Foundation

class WeatherService {
    func getWeather(city: String, completion: @escaping(Weather?) ->()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=c6c2cf01b2f1af67b3ef3708afc0a8f2&unit=imperial") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
