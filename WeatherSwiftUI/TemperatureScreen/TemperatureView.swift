//
//  TestView.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 18/05/2024.
//

import SwiftUI

struct TemperatureView: View {
    
    var hours: [Hour]
    
    var body: some View {
        ZStack {
            Image(.day)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            List(hours, id: \.epoch) { hour in
                TemperatureRow(hour: hour)
            }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            .listStyle(.plain)
        }
    }
}

#Preview {
    TemperatureView(hours: hours)
}
