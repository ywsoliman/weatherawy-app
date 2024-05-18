//
//  LoadingView.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 18/05/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Color(.systemBackground).edgesIgnoringSafeArea(.all)
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            .scaleEffect(2)
    }
}

#Preview {
    LoadingView()
}
