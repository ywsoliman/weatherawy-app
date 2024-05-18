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
    
    private var conditionIconURL: URL? {
        URL(string: "https:\(currentForecast.day.condition.icon)")
    }
    
    private var minAndMaxTemp: String {
        "\(currentForecast.day.mintemp)° - \(currentForecast.day.maxtemp)°"
    }
    
    var body: some View {
        HStack {
            Text(dayOfWeek(from: currentForecast.dateEpoch))
            Spacer()
            if let conditionIconURL {
                KFImage(conditionIconURL)
            }
            Spacer()
            Text(minAndMaxTemp)
            Spacer()
            Image(systemName: "chevron.right")
        }
    }
}

#Preview {
    ForecastRow(currentForecast: forecastDay)
}
