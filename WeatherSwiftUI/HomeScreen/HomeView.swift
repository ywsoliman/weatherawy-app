//
//  HomeView.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 18/05/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var homeViewModel = HomeViewModel(service: APIService.shared)
    
    var body: some View {
        ZStack {
            Image(.day)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                if let weather = homeViewModel.weather {
                    TopView(weather: weather)
                } else {
                    LoadingView()
                }
            }
        }
        .onAppear { homeViewModel.fetchWeather() }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
