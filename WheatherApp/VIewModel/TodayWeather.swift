//
//  ForecastWeather.swift
//  WheatherApp
//
//  Created by Оля on 27.04.2021.
//

import Foundation

class TodayWeather {
    var cityName: String
    var contryName: String
    var cityContry: String {
        return "\(cityName), \(contryName)"
    }
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
        return "\(Int(temperature)) °C"
    }
   
    var date: String
    var description: String
  
    var iconImage: String
    
    var humidity: Int
    var humidityString: String {
        return "\(Int(humidity)) %"
    }
    var rainLevel: Double
    var rainLevelString: String {
        return "\(Int(rainLevel)) mm"
    }
    var pressure: Int
    var pressureString: String {
        return "\(Int(pressure)) pHa"
    }
    var windSpeed: Double
    var windSpeedString: String {
        return "\((windSpeed * 3.6).rounded()) km/h"
    }
    var windDegree: Int
    var windDirection: String {
        let compassSector = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW", "N"];
        let direction = compassSector[Int((windDegree / Int(22.5)))]
        return direction
    }
   
    init?(forecastWheather:  Welcome) {
        cityName = forecastWheather.city.name
        contryName = forecastWheather.city.country
        conditionCode = forecastWheather.list.first?.weather.first?.id ?? 0
        temperature = forecastWheather.list.first?.main.temp ?? 0
        date = forecastWheather.list.first?.dtTxt ?? "none"
        description = forecastWheather.list.first?.weather.first?.weatherDescription ?? "none"
        iconImage = forecastWheather.list.first?.weather.first?.icon ?? "none icon"
        humidity = forecastWheather.list.first?.main.humidity ?? 0
        pressure = forecastWheather.list.first?.main.pressure ?? 0
        windSpeed = forecastWheather.list.first?.wind.speed ?? 0
        windDegree = forecastWheather.list.first?.wind.deg ?? 0
        rainLevel = forecastWheather.list.first?.rain?.the3H ?? 0
   }
}
