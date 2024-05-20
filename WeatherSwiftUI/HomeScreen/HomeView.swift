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
        NavigationView {
            ZStack {
                BackgroundImage()
                VStack {
                    if let weather = homeViewModel.weather {
                        TopView(weather: weather)
                        MiddleView(forecast: weather.forecast)
                        BottomView(current: weather.current)
                    } else {
                        LoadingView()
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
            }
        }
        .foregroundStyle(isTimeBetween5AMAnd6PM() ? Color.black : Color.white)
        .onAppear { homeViewModel.checkIfLocationEnabled() }
    }
}

#Preview {
    HomeView()
}
