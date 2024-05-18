//
//  HomeViewModel.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 18/05/2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var weather: Weather?
    private var service: APIServiceProtocol
    
    init(service: APIServiceProtocol) {
        self.service = service
    }
    
    func fetchWeather() {
        
        service.fetch(lat: 30.0131363, lon: 31.1852572) { [weak self] response, error in
            
            DispatchQueue.main.async {
                
                if let response = response {
                    self?.weather = response
                } else {
                    print("Error: \(error?.localizedDescription ?? "N/A")")
                }
                
            }
        }

    }
    
}
