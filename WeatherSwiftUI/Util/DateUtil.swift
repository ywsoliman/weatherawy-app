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

func convertEpochToTime(epoch: TimeInterval) -> String {
    let date = Date(timeIntervalSince1970: epoch)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "h a"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    let timeString = dateFormatter.string(from: date)
    return timeString
}

func isTimeBetween5AMAnd6PM() -> Bool {
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    return hour >= 5 && hour < 18
}
