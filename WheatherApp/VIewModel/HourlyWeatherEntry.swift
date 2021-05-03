//
//  HourlyWeatherEntry.swift
//  WheatherApp
//
//  Created by Оля on 30.04.2021.
//

import Foundation

struct HourlyWeatherEntry {
    var conditionCode: Int
    var systemIconNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.min.fill"
        case 801...804: return "cloud.fill"
        default: return "nosign"
        }
    }
    
    var temperature: Double
    var temperatureString: String {
        return "\(Int(temperature)) °"
    }
    
    var dateD: Date
    var description: String
}

struct HourlyWeather {
    let hourlyWeatherEntries: [HourlyWeatherEntry]
    
    init?(hourly: Welcome) {
        hourlyWeatherEntries = hourly.list.map {
            let timeInterval = Double($0.dt)
            return HourlyWeatherEntry(conditionCode: $0.weather.first?.id ?? 0,
                                      temperature: $0.main.temp,
                                      dateD: Date(timeIntervalSince1970: timeInterval),
                                      description: $0.weather.first?.weatherDescription ?? "?? 0")
        }
    }
}

