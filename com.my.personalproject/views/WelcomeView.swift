//
//  WelcomeView.swift
//  com.my.personalproject
//
//  Created by Khoa Le on 6/16/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject
    var locationManager : LocationManager;
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 20) {
                Text("Welcome to my weather App")
                    .bold()
                    .font(.title)
                
                Text("Please share your location to get the weather in the area")
                    .font(.title3)
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
            
            LocationButton(
                .shareCurrentLocation
            ) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(Color.white)
        }
 
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
