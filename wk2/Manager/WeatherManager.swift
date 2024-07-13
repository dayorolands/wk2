//
//  WeatherManager.swift
//  wk2
//
//  Created by Dayo Adekoya on 7/13/24.
//

import Foundation
import CoreLocation
import Security

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> GetWeatherResponseBody {
        guard let retrievedApiKey = retrievedApiKeyFromKeyChain() else {
            throw ApiKeyError.unableToFetchApiKey
        }
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(String(retrievedApiKey))&units=metric") else {
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

func storeApiKeyinKeyChain(apiKey: String) throws {
    let keychainQuery: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: "OpenWeatherMapApiKey",
        kSecValueData as String: apiKey.data(using: .utf8)!
    ]
    let status = SecItemAdd(keychainQuery as CFDictionary, nil)
    assert(status == errSecSuccess, "Failed to store API key in keychain")
}

func retrievedApiKeyFromKeyChain() -> String? {
    let keychainQuery: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: "OpenWeatherMapApiKey",
        kSecReturnData as String: kCFBooleanTrue!,
        kSecMatchLimit as String: kSecMatchLimitOne
    ]
    
    var dataTypeReference: AnyObject? = nil
    let status: OSStatus = SecItemCopyMatching(keychainQuery as CFDictionary, &dataTypeReference)
    if status == errSecSuccess {
        if let retrievedData = dataTypeReference as? Data,
           let apiKey = String(data: retrievedData, encoding: .utf8){
            return apiKey
        }
    }
    
    return nil
}

