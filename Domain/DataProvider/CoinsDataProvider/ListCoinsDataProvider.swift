//
//  ListCoinsDataProvider.swift
//  MarketCoins
//
//  Created by Adalto Picotti Junior on 15/08/23.
//

import Foundation


protocol ListCoinsDataProviderDelegate: GenericDataProviderDelegate {}


class ListCoinsDataProvider: DataProviderManager<ListCoinsDataProviderDelegate, [CoinModel]> {
    
    private let coinsStore: CoinsStoreProtocol?
    
    init(coinsStore: CoinsStoreProtocol = CoinsStore()) {
        self.coinsStore = coinsStore
    }
    
    func fetchListCoins(by vsCurrency: String,
                        with cryptoCurrency: [String]?,
                        orderBy order: String,
                        total perPage: Int,
                        page: Int,
                        percentagePrice: String) {
        coinsStore?.fetchListCoins(by: vsCurrency,
                                   with: cryptoCurrency,
                                   orderBy: order,
                                   total: perPage,
                                   page: page,
                                   percentagePrice: percentagePrice,
                                   completion: { result, error in
            if let error {
                self.delegate?.errorData(self.delegate, error: error)
            }
            
            if let result {
                self.delegate?.success(model: result)
            }
        })
    }
}
