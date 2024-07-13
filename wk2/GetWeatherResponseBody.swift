//
//  GetWeatherResponseBody.swift
//  wk2
//
//  Created by Dayo Adekoya on 7/13/24.
//

import Foundation


struct GetWeatherResponseBody : Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    
    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }
    
    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
        var sea_level: Double
        var grnd_level: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
        var gust: Double
    }
}


enum WeatherError : Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

enum ApiKeyError: Error {
    case unableToStoreApiKey
    case unableToFetchApiKey
}
