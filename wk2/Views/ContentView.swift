//
//  ContentView.swift
//  wk2
//
//  Created by Dayo Adekoya on 7/13/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weatherResponse : GetWeatherResponseBody?
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weatherResponse {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weatherResponse = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                print("The response is : \(String(describing: weatherResponse))")
                            }  catch WeatherError.invalidURL {
                                print("Invalid URL detected")
                            } catch WeatherError.invalidData {
                                print("Could not parse data from server, please try again.")
                            } catch {
                                print("Error fetching weather data : \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue:0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        .task {
            do {
                try await KeyConstants.loadApiKey()
            } catch {
                print("The error from storing the key is \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}
