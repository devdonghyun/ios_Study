//
//  WeatherData.swift
//  Clima
//
//  Created by 안동현 on 2021/10/26.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable { // Codable : Decodable + Encodable
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
