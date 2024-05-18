//
//  HomeView.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 18/05/2024.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var homeViewModel = HomeViewModel(service: APIService.shared)
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(.day)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack {
                    if let weather = homeViewModel.weather {
                        Spacer()
                        TopView(weather: weather)
                        MiddleView(forecast: weather.forecast)
                        Spacer()
                    } else {
                        LoadingView()
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
            }
        }
        .onAppear { homeViewModel.fetchWeather() }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
