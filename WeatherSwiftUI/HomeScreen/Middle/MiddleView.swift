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
            ForEach(Array(forecast.forecastday.enumerated()), id: \.element.dateEpoch) { index, day in
                
                let label = (index == 0) ? "Today" : dayOfWeek(from: day.dateEpoch)
                
                NavigationLink(destination: TemperatureView()) {
                    ForecastRow(currentForecast: day, dayLabel: label)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

#Preview {
    MiddleView(forecast: forecast)
}
