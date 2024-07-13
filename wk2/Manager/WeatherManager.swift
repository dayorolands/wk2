//
//  WeatherManager.swift
//  wk2
//
//  Created by Dayo Adekoya on 7/13/24.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> GetWeatherResponseBody {
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("da5abb47a65a01359f335fb852cd5ac5")&units=metric") else {
            throw WeatherError.invalidURL
        }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw WeatherError.invalidResponse }
        
        do {
            let decodeResponse = try JSONDecoder().decode(GetWeatherResponseBody.self, from: data)
            return decodeResponse
        } catch {
            throw WeatherError.invalidData
        }
    }
}


