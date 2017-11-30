//
//  Weather.swift
//  WeatherApp
//
//  Created by Vandan Patel on 11/29/17.
//  Copyright © 2017 Vandan Patel. All rights reserved.
//

import Foundation

class Weather: Codable {
    let forecast: Forecast
}

struct Forecast: Codable {
    let forcastText: ForecastText
    
    private enum CodingKeys: String, CodingKey {
        case forcastText = "txt_forecast"
    }
}

struct ForecastText: Codable {
    let date: String
    let forecastDays: [ForecastDay]
    
    private enum CodingKeys: String, CodingKey {
        case date
        case forecastDays = "forecastday"
    }
}

struct ForecastDay: Codable {
    let iconURL: String
    let day: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case iconURL = "icon_url"
        case day = "title"
        case description = "fcttext"
    }
}
