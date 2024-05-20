//
//  Forecast.swift
//  WeatherSwiftUI
//
//  Created by Youssef Waleed on 18/05/2024.
//

import Foundation

// MARK: - Weather
struct Weather: Codable {
    var location: Location
    var current: Current
    var forecast: Forecast
}

// MARK: - Current
struct Current: Codable {
    var temp: Double
    var condition: Condition
    var pressure, humidity: Int
    var feelslike: Double
    var visibility: Int

    enum CodingKeys: String, CodingKey {
        case temp = "temp_c"
        case condition
        case pressure = "pressure_mb"
        case humidity
        case feelslike = "feelslike_c"
        case visibility = "vis_km"
    }
}

// MARK: - Condition
struct Condition: Codable {
    var text, icon: String
}

// MARK: - Forecast
struct Forecast: Codable {
    var forecastday: [ForecastDay]
}

// MARK: - Forecastday
struct ForecastDay: Codable {
    var dateEpoch: TimeInterval
    var day: Day
    var hour: [Hour]
    
    enum CodingKeys: String, CodingKey {
        case dateEpoch = "date_epoch"
        case day, hour
    }
}

// MARK: - Day
struct Day: Codable {   
    var maxtemp, mintemp, avgtemp: Double
    var condition: Condition

    enum CodingKeys: String, CodingKey {
        case maxtemp = "maxtemp_c"
        case mintemp = "mintemp_c"
        case avgtemp = "avgtemp_c"
        case condition
    }
}

// MARK: - Hour
struct Hour: Codable {
    var epoch: TimeInterval
    var time: String
    var temp: Double
    var condition: Condition

    enum CodingKeys: String, CodingKey {
        case epoch = "time_epoch"
        case temp = "temp_c"
        case time, condition
    }
}

// MARK: - Location
struct Location: Codable {
    var name, country: String
    var lat, lon: Double
    var tzID, localtime: String
    var localEpoch: TimeInterval

    enum CodingKeys: String, CodingKey {
        case tzID = "tz_id"
        case localEpoch = "localtime_epoch"
        case name, country, lat, lon, localtime
    }
}

let condition = Condition(text: "Sunny", icon: "//cdn.weatherapi.com/weather/64x64/day/113.png")

// Sample data for Current
let current = Current(
    temp: 25,
    condition: condition,
    pressure: 1012,
    humidity: 50,
    feelslike: 24.5,
    visibility: 10
)

// Sample data for Hour
let hour1 = Hour(epoch: 1716080400, time: "2024-05-18 01:00", temp: 20.0, condition: condition)
let hour2 = Hour(epoch: 1716080400, time: "2024-05-18 02:00", temp: 19.0, condition: condition)
let hour3 = Hour(epoch: 1716080400, time: "2024-05-18 03:00", temp: 29.0, condition: condition)
let hour4 = Hour(epoch: 1716080400, time: "2024-05-18 04:00", temp: 15.0, condition: condition)
let hour5 = Hour(epoch: 1716080400, time: "2024-05-18 05:00", temp: 13.0, condition: condition)
let hours = [hour1, hour2, hour3, hour4, hour5]

// Sample data for Day
let day = Day(maxtemp: 25.0, mintemp: 18.0, avgtemp: 21.5, condition: condition)

// Sample data for ForecastDay
let forecastDay = ForecastDay(dateEpoch: 1715990400, day: day, hour: hours)
let forecastDays = [forecastDay, forecastDay, forecastDay]

// Sample data for Forecast
let forecast = Forecast(forecastday: forecastDays)

// Sample data for Location
let location = Location(
    name: "London",
    country: "UK",
    lat: 30.0131363,
    lon: 31.1852572,
    tzID: "Africa/Cairo",
    localtime: "2024-05-18 12:00",
    localEpoch: 1715990400
)

// Creating an instance of Weather
let fakeWeather = Weather(location: location, current: current, forecast: forecast)
