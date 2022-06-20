//
//  LocationManager.swift
//  com.my.personalproject
//
//  Created by Khoa Le on 6/16/22.
//

import Foundation
import CoreLocation


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate  {
    let manager = CLLocationManager()
    
        
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading: Bool = false
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true;
        manager.requestLocation()
    }
    
  
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.first?.coordinate;
        isLoading = false;
    }
    
    func currentLocation() -> CLLocationCoordinate2D? {
        return self.location ?? nil;
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting lcoation", error)
        isLoading = false;
    }
    
}
