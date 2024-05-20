//
//  HomeViewModel.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 18/05/2024.
//

import Foundation
import CoreLocation

final class HomeViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var weather: Weather?
    @Published var showNoLocationAlert = false
    private var service: APIServiceProtocol
    private var locationManager: CLLocationManager?
    
    init(service: APIServiceProtocol) {
        self.service = service
    }
    
    func fetchWeather(lat: Double, lon: Double) {
        
        service.fetch(lat: lat, lon: lon) { [weak self] response, error in
            
            DispatchQueue.main.async {
                
                if let response = response {
                    self?.weather = response
                } else {
                    print("Error: \(error?.localizedDescription ?? "N/A")")
                }
                
            }
        }
        
    }
    
    func checkIfLocationEnabled() {
        locationManager = CLLocationManager()
        locationManager!.delegate = self
    }
    
    private func checkLocationAuthorization() {
        
        guard let locationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("restricted")
        case .denied:
            showNoLocationAlert = true
        case .authorizedAlways, .authorizedWhenInUse:
            showNoLocationAlert = false
            if let location = locationManager.location {
                fetchWeather(
                    lat: location.coordinate.latitude,
                    lon: location.coordinate.longitude
                )
            }
        @unknown default:
            break
        }
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    
    
}
