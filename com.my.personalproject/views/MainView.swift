//
//  MainView.swift
//  com.my.personalproject
//
//  Created by Khoa Le on 6/16/22.
//

import SwiftUI
import CoreLocationUI

struct MainView: View {
    @StateObject
    var locationManager : LocationManager = LocationManager()
    
    
    var weatherManager: WeatherManager = WeatherManager()
    
    @State
    var currenWeather: ResponseBody?;
    
    var body: some View {
        VStack {
            Spacer()
            
            if let location = locationManager.location {
                if let weather = currenWeather {
//                    Text("Weather found: \(weather.name)")
                    WeatherView(weather: weather)
                } else {
                   LoadingView()
                        .task {
                            do {
                                currenWeather = try await weatherManager.getCurrentWeather(lat: location.latitude, lon: location.longitude)
                            } catch {
                                print("Fetch Weather error: \(error)")
                            }
                        }
                }
                    
                HStack{
                    Text("Your location is \(location.longitude), \(location.latitude)")
                }
                
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(self.locationManager)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color(hue: 0.707, saturation: 0.905, brightness: 0.669))
        .preferredColorScheme(.dark)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
