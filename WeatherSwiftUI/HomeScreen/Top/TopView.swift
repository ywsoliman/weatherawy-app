//
//  TopView.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 18/05/2024.
//

import SwiftUI
import Kingfisher

struct TopView: View {
    
    var weather: Weather
    
    private var locationText: String {
        "\(weather.location.name), \(weather.location.country)"
    }
    
    private var temperatureText: String {
        "\(weather.current.temp)°"
    }
    
    private var conditionText: String {
        weather.current.condition.text
    }
    
    private var maxTempText: String {
        "H:\(weather.forecast.forecastday[0].day.maxtemp)°"
    }
    
    private var minTempText: String {
        "L:\(weather.forecast.forecastday[0].day.mintemp)°"
    }
    
    private var conditionIconURL: URL? {
        URL(string: "https:\(weather.current.condition.icon)")
    }
    
    var body: some View {
        VStack {
            Image(systemName: "mappin")
            Text(locationText)
                .bold()
            Text(temperatureText)
                .bold()
            Text(conditionText)
            HStack {
                Text(maxTempText)
                Text(minTempText)
            }
            if let url = conditionIconURL {
                KFImage(url)
            }
        }
    }
}

#Preview {
    TopView(weather: fakeWeather)
}
