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
                
                let isToday = (index == 0)
                let label = (index == 0) ? "Today" : dayOfWeek(from: day.dateEpoch)
                let hours: [Hour] = (index == 0) ? removePassedHours(day) : day.hour
                NavigationLink(destination: TemperatureView(hours: hours, isToday: isToday)) {
                    ForecastRow(currentForecast: day, dayLabel: label)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    func removePassedHours(_ day: ForecastDay) -> [Hour] {
        return day.hour.filter { time in
            Date().timeIntervalSince1970 - 3000 < time.epoch
        }
    }
}

#Preview {
    MiddleView(forecast: forecast)
}
