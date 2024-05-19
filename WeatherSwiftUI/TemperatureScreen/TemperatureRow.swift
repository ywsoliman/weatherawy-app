//
//  TemperatureRow.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 19/05/2024.
//

import SwiftUI
import Kingfisher

struct TemperatureRow: View {
    
    var hour: Hour
    
    private var conditionIconURL: URL? {
        URL(string: "https:\(hour.condition.icon)")
    }
    
    var body: some View {
        HStack {
            Spacer()
            Text(convertEpochToTime(epoch: hour.epoch))
            Spacer()
            if let conditionIconURL {
                KFImage(conditionIconURL)
            }
            Spacer()
            Text(String(format: "%.1f°", hour.temp))
            Spacer()
        }
        .listRowBackground(Color.clear)
    }
}

#Preview {
    TemperatureRow(hour: hour1)
}
