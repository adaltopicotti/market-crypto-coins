//
//  GlobalValuesDataProvider.swift
//  MarketCoins
//
//  Created by Adalto Picotti Junior on 16/08/23.
//

import Foundation

protocol GlobalValuesDataProviderDelegate: GenericDataProviderDelegate { }

class GlobalValuesDataProvider: DataProviderManager<GlobalValuesDataProviderDelegate, GlobalModel> {
    private let globalStore: GlobalStoreProtocol?
    
    init(globalStore: GlobalStoreProtocol = GlobalStore()) {
        self.globalStore = globalStore
    }
    
    func fetchGlobalValues() {
        globalStore?.fetchGlobal(completion: { result, error in
            if let error {
                self.delegate?.errorData(self.delegate, error: error)
            }
            
            if let result {
                self.delegate?.success(model: result)
            }
        })
    }
}
