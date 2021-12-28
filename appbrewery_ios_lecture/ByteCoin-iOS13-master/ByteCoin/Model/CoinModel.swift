//
//  CoinModel.swift
//  ByteCoin
//
//  Created by 안동현 on 2021/12/28.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let rate: Double
    let currency: String
    
    var formattedCoinRate: String {
        return String(format: "%.2f", rate)
    }
    
    
}
