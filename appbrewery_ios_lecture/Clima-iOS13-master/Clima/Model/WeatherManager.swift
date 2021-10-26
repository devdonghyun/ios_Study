//
//  WeatherManager.swift
//  Clima
//
//  Created by 안동현 on 2021/10/25.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=4bd028a7c19f1916fedf0a9f55e0806b&units=metric"
    
    func fetchWeater(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1. Create a URL
        
        if let url = URL(string: urlString) {
            
            // 2. Create a URLSession
            
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                }
                
                if let safeData = data {
//                    let dataString = String(data: safeData, encoding: .utf8)
//                    print(dataString)
                    self.parseJson(weatherData: safeData)
                    
                }
            }
            // return URLSessionDataTask
            
            // 4. Start the task
            task.resume()
            
            
        }
    }
    
    func parseJson(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.main.temp)
            print(decodedData.weather[0].description)
        } catch {
            print(error)
        }
        
        
    }
    
}
