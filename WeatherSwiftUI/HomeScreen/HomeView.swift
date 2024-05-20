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
                        if homeViewModel.showNoLocationAlert {
                            Text("Location isn't enabled")
                        } else {
                            LoadingView()
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
            }
            .alert(isPresented: $homeViewModel.showNoLocationAlert) {
                locaitonIsDisabledAlert()
            }
        }
        
        .foregroundStyle(isTimeBetween5AMAnd6PM() ? Color.black : Color.white)
        .onAppear { 
            homeViewModel.checkIfLocationEnabled() }
    }
    
    func locaitonIsDisabledAlert() -> Alert {
        return Alert(
            title: Text("Location Services Disabled"),
            message: Text("Please enable location services in Settings."),
            primaryButton: .default(Text("Settings"), action: {
                openAppSettings()
            }),
            secondaryButton: .cancel({
                homeViewModel.showNoLocationAlert = true
            })
        )
    }
    
    func openAppSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
    }
    
}

#Preview {
    HomeView()
}
