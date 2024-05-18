//
//  APIService.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 18/05/2024.
//

import Foundation
import Alamofire

struct APIService: APIServiceProtocol {
    
    static let shared = APIService()
    
    private init() {}
    
    func fetch(lat: Double, lon: Double, completionHandler: @escaping (Weather?, Error?) -> Void) {
        
        let parameters = [
            "key": Constants.API_KEY,
            "q": "\(lat),\(lon)",
            "days": "3",
            "aqi": "no",
            "alerts": "no"
        ]
        
        AF.request(Constants.BASE_URL, parameters: parameters).responseDecodable(of: Weather.self) { response in
            
            switch response.result {
            case .success(let result):
                completionHandler(result, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
        
    }
    
}
