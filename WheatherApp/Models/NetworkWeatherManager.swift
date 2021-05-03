//
//  NetworkWeatherManager.swift
//  WheatherApp
//
//  Created by Оля on 25.04.2021.
//

import Foundation
import CoreLocation

class NetworkWeatherManager {
    
    func fetchtWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping (TodayWeather) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {
            return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let forecastWheatherData = try decoder.decode(Welcome.self, from: data)
                    if let forecastWheather = TodayWeather(forecastWheather: forecastWheatherData) {
                        completion(forecastWheather)
                    }
                }
                catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    func fetchHourlyWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping (HourlyWeather) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {
            print("!")
            return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let forecastWheatherData = try decoder.decode(Welcome.self, from: data)
                    
                    if let hourlytWheather = HourlyWeather(hourly: forecastWheatherData) {
                        completion(hourlytWheather)
                    }
                }
                catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
