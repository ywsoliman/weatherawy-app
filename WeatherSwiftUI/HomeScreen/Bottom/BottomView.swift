//
//  BottomView.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 18/05/2024.
//

import SwiftUI

struct BottomView: View {
    
    var current: Current
    
    var body: some View {
        Grid(horizontalSpacing: 75, verticalSpacing: 40) {
            GridRow {
                VStack {
                    Text("Visibility")
                    Text("\(current.visibility) KM")
                        .font(.title)
                }
                VStack {
                    Text("Humidity")
                    Text("\(current.humidity)%")
                        .font(.title)
                }
            }
            GridRow {
                VStack {
                    Text("Feels Like")
                    Text(String(format: "%.1f°", current.feelslike))
                        .font(.title)
                }
                VStack {
                    Text("Pressure")
                    Text("\(current.pressure)")
                        .font(.title)
                }
            }
        }.padding()
    }
}

#Preview {
    BottomView(current: current)
}
