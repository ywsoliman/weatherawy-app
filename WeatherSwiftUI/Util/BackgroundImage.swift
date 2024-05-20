//
//  BackgroundImage.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 20/05/2024.
//

import SwiftUI

struct BackgroundImage: View {
    var body: some View {
        Image(isTimeBetween5AMAnd6PM() ? .day : .night)
            .resizable()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundImage()
}
