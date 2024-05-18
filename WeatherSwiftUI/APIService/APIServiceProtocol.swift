//
//  APIServiceProtocol.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 18/05/2024.
//

import Foundation

protocol APIServiceProtocol {
    func fetch(lat: Double, lon: Double, completionHandler: @escaping (Weather?, Error?) -> Void)
}
