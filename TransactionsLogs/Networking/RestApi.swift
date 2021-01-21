//
//  ApiClient.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 21.01.2021.
//

import Alamofire
import SwiftyJSON

class RestApi: API {
    
    func transactions(id: String, handler: @escaping ((Result<Transaction?>) -> Void)) {
        self.request(ApiRouter.getTransactions(id: id), handler: {result in
            switch result {
            case let .success(data):
                DispatchQueue.main.async {
                    handler(.success(Transaction(json: JSON(data))))
                }
            case let .failure(err):
                DispatchQueue.main.async {
                    handler(.failure(err))
                }
            }
        })
    }
    
    func creditCheck(id: Int, handler: @escaping ((Result<CreditCheck?>) -> Void)) {
        self.request(ApiRouter.getCreditCheck(id: id), handler: {result in
            switch result {
            case let .success(data):
                DispatchQueue.main.async {
                    handler(.success(CreditCheck(json: JSON(data))))
                }
            case let .failure(err):
                DispatchQueue.main.async {
                    
                    handler(.failure(err))
                }
            }
        })
    }
    
    private func request(_ urlConvertible: URLRequestConvertible, handler: @escaping ((Result<Any>) -> Void)) {
        AF.request(urlConvertible)
            .responseJSON(completionHandler: { (response) in
                switch response.result {
                case let .success(value):
                    handler(.success(value))
                case let .failure(error):
                    handler(.failure(error))
                }
            })
    }
}
