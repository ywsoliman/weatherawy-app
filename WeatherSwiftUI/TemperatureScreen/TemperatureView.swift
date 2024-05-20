//
//  TestView.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 18/05/2024.
//

import SwiftUI

struct TemperatureView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var hours: [Hour]
    
    var body: some View {
        ZStack {
            Image(isTimeBetween5AMAnd6PM() ? .day : .night)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            List(hours, id: \.epoch) { hour in
                TemperatureRow(hour: hour)
            }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                .listStyle(.plain)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                customBackButton()
            }
        }
    }
    
    func customBackButton() -> Button<Image> {
        return Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "arrowshape.turn.up.backward.fill")
        }
    }
}

#Preview {
    TemperatureView(hours: hours)
}
