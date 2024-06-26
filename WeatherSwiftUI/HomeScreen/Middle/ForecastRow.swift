//
//  ForecastRow.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 18/05/2024.
//

import SwiftUI
import Kingfisher

struct ForecastRow: View {
    
    var currentForecast: ForecastDay
    var dayLabel: String
    
    private var conditionIconURL: URL? {
        URL(string: "https:\(currentForecast.day.condition.icon)")
    }
    
    private var minAndMaxTemp: String {
        "\(currentForecast.day.mintemp)° - \(currentForecast.day.maxtemp)°C"
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(dayLabel)
                Spacer()
                if let conditionIconURL {
                    KFImage(conditionIconURL)
                }
                Spacer()
                Text(minAndMaxTemp)
                Spacer()
                Image(systemName: "chevron.right")
            }
            Divider()
                .background(Color.black)
        }
    }
}

#Preview {
    ForecastRow(currentForecast: forecastDay, dayLabel: "Today")
}
