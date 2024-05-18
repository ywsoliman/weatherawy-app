//
//  MiddleView.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 18/05/2024.
//

import SwiftUI

struct MiddleView: View {
    
    var forecast: Forecast
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("3-DAY FORECAST")
                .bold()
            Divider()
                .background(Color.black)
            ForEach(forecast.forecastday, id: \.dateEpoch) { day in
                NavigationLink(destination: TemperatureView()) {
                    ForecastRow(currentForecast: day)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

#Preview {
    MiddleView(forecast: forecast)
}
