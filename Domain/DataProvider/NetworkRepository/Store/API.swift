//
//  API.swift
//  MarketCoins
//
//  Created by Adalto Picotti Junior on 11/08/23.
//

import Foundation


struct API {
    
    static let baseURL = "https://api.coingecko.com/api/v3"
    static let coinsMarkets = "/coins/markets"
    static let coinsByIdMarketChart = "/coins/%@market_chart/range"
    static let coinsByIdOhlc = "/coins/%@/ohlc"
    static let global = "/global"
    static let coinsById = "/coins/%@"
    
    
}
