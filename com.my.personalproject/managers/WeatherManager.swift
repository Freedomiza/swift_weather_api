//
//  WeatherManager.swift
//  com.my.personalproject
//
//  Created by Khoa Le on 6/17/22.
//

import Foundation
import CoreLocation

class WeatherManager {
    let apiKey = ProcessInfo.processInfo?.environment["WEATHER_API_KEY"] ?? ""
    
    
    func getCurrentWeather(lat: CLLocationDegrees, lon: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(String(lat))&lon=\(String(lon))&appid=\(apiKey)")
        else {
            fatalError("Missing url")
        }
        
        let urlReq = URLRequest(url: url);
        
        
        let (data, response) = try await URLSession.shared.data(for: urlReq);
         
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data")}
        
        let responseBody = try JSONDecoder().decode(ResponseBody.self,from: data);
        
        return responseBody;
        
        
        
    }
}



// Model of the response body we get from calling the OpenWeather API
struct ResponseBody: Decodable {
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
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
