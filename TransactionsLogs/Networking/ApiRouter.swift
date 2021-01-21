//
//  ApiRouter.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 21.01.2021.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {
    
    case getTransactions(id: String)
    case getCreditCheck(id: Int)

    //MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // Method
        urlRequest.httpMethod = method.rawValue
        
        // Headers
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.acceptType.rawValue)
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    //MARK: - HttpMethod
    private var method: HTTPMethod {
        switch self {
        case .getTransactions:
            return .get
        case .getCreditCheck:
            return .get
        }
    }
    
    //MARK: - Path
    private var path: String {
        switch self {
        case .getTransactions:
            return "b/6008d32a973914580687dedf/1"
        case .getCreditCheck:
            return "b/6008d32a973914580687dedf/2"
        }
    }
    
    //MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case let .getTransactions(id):
            return ["id" : id]
        case let .getCreditCheck(id):
            return ["id" : id]
        }
    }
}
