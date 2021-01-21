//
//  Constants.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 21.01.2021.
//

struct Constants {
    
    // Base URL
    static let baseUrl = Configs.Network.baseUrl
    
    // Header
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    // Content type (JSON)
    enum ContentType: String {
        case json = "application/json"
    }
}
