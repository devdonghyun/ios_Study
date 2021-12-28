//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoinRate(_ coinManager: CoinManager, coin: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "15947F3D-B040-4F9E-AAD1-46DDBD3612AD"
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        self.fetchCoinPrice(currency: currency)
    }
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func fetchCoinPrice(currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {
                data, response, error in
                if error != nil {
                    print(error!)
                    self.delegate?.didFailWithError(error: error!)
                }
                if let safeData = data {
//                    print(String(data: safeData, encoding: .utf8))
                    if let coin = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCoinRate(self, coin: coin)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(CoinData.self, from: data)
            let rate = decodeData.rate
            let currency = decodeData.asset_id_quote
            let coin = CoinModel(rate: rate, currency: currency)
            return coin
        } catch {
            print(error)
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
