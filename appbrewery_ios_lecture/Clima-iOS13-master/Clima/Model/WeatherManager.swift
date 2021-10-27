//
//  WeatherManager.swift
//  Clima
//
//  Created by 안동현 on 2021/10/25.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation


protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}


struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=4bd028a7c19f1916fedf0a9f55e0806b&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeater(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // 1. Create a URL
        
        if let url = URL(string: urlString) {
            
            // 2. Create a URLSession
            
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    self.delegate?.didFailWithError(error: error!)
                }
                
                if let safeData = data {
//                    let dataString = String(data: safeData, encoding: .utf8)
//                    print(dataString)
                    if let weather = self.parseJson(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            // return URLSessionDataTask
            
            // 4. Start the task
            task.resume()
            
            
        }
    }
    
    func parseJson(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            print(decodedData.main.temp)
            print(decodedData.weather[0].id)
            print(weather.conditionName)
            print(weather.formattedTemperature)
            
            return weather
        
        } catch {
            print(error)
            delegate?.didFailWithError(error: error)
            return nil
        }
        
        
    }
    
    
    
}
