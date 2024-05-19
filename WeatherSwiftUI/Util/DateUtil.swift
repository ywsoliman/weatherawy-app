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
    let formatter = DateFormatter()
    formatter.dateFormat = "h a"
    formatter.amSymbol = "AM"
    formatter.pmSymbol = "PM"
    formatter.locale = Locale.current
    return formatter.string(from: date)
}
