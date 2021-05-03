//
//  ForecastData.swift
//  WheatherApp
//
//  Created by Оля on 25.04.2021.
//

import Foundation
// MARK: - Welcome
struct Welcome: Codable {
    let list: [List]
    let city: City
}

// MARK: - City
struct City: Codable {
    let name: String
    let country: String
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double
}

// MARK: - List
struct List: Codable {
    let dt: Int
    let main: MainClass
    let weather: [Weather]
    let wind: Wind
    let dtTxt: String
    let rain: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, wind
        case dtTxt = "dt_txt"
        case rain
    }
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case pressure
        case humidity
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}


// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}

 
