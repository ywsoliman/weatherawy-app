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
    var temp: Int
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
    var date: String
    var day: Day
    var hour: [Hour]
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
    var time: String
    var temp: Double
    var condition: Condition

    enum CodingKeys: String, CodingKey {
        case time
        case temp = "temp_c"
        case condition
    }
}

// MARK: - Location
struct Location: Codable {
    var name, country: String
    var lat, lon: Double
    var tzID, localtime: String

    enum CodingKeys: String, CodingKey {
        case name, country, lat, lon
        case tzID = "tz_id"
        case localtime
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
let hour1 = Hour(time: "2024-05-18 01:00", temp: 20.0, condition: condition)
let hour2 = Hour(time: "2024-05-18 02:00", temp: 19.0, condition: condition)
let hours = [hour1, hour2]

// Sample data for Day
let day = Day(maxtemp: 25.0, mintemp: 18.0, avgtemp: 21.5, condition: condition)

// Sample data for ForecastDay
let forecastDay = ForecastDay(date: "2024-05-18", day: day, hour: hours)
let forecastDays = [forecastDay]

// Sample data for Forecast
let forecast = Forecast(forecastday: forecastDays)

// Sample data for Location
let location = Location(
    name: "London",
    country: "UK",
    lat: 30.0131363,
    lon: 31.1852572,
    tzID: "Africa/Cairo",
    localtime: "2024-05-18 12:00"
)

// Creating an instance of Weather
let fakeWeather = Weather(location: location, current: current, forecast: forecast)
