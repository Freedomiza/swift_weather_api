//
//  WeatherView.swift
//  com.my.personalproject
//
//  Created by Khoa Le on 6/17/22.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody;
    let degreeSign = "°C";
    let speedSign = "m/s";
    let percentSign = "%";
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 5)  {
                
                VStack (alignment: .leading){
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            VStack(spacing: 20) {
                                Image("sunny")
                                    .resizable()
                                    .font(.system(size: 40))
                                
                                    .aspectRatio(contentMode: .fit)
                                
                                Text(weather.weather[0].main)
                                
                            }
                            .frame(width:  100, alignment: Alignment.leading)
                            
                            Text(weather.main.feelsLike.roundDouble() + degreeSign)
                                .bold()
                                .font(.system(size: 100))
                                .padding()
                            
                            
                            
                        }
                        Spacer()
                        
                        AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png"))
                        { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 350)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
            .padding()
            
            VStack(alignment: .leading) {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Weather now")
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp ", value: weather.main.tempMin.roundDouble() + degreeSign)
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Max temp ", value: weather.main.tempMax.roundDouble() + degreeSign)
                        
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + speedSign)
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble() + percentSign)
                        
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.707, saturation: 0.905, brightness: 0.669))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            .frame(maxWidth: .infinity)
        }
        
        .edgesIgnoringSafeArea(.bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.707, saturation: 0.905, brightness: 0.669))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(
            weather: previewWeather
        )
    }
}
