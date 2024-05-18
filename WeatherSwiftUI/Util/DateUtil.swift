//
//  DateUtil.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 18/05/2024.
//

import Foundation

func dayOfWeek(from epoch: TimeInterval) -> String {
    let date = Date(timeIntervalSince1970: epoch)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "E"
    let dayOfWeekString = dateFormatter.string(from: date)
    return dayOfWeekString
}
