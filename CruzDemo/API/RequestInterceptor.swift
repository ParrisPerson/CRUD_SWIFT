//
//  RequestInterceptor.swift
//  Lendu
//
//   
//

import Foundation
import Alamofire

class RequestInterceptor: RequestAdapter {
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlReq = urlRequest
        if urlReq.url!.absoluteString.contains("public") {
            urlReq.setValue(Environment.currentApiKey, forHTTPHeaderField: WebServiceConstants.Headers.headerName)
        }
        else {
            urlReq.setValue(KeychainPreferences.tokenSession != nil ? KeychainPreferences.tokenSession : KeychainPreferences.tokenBiometric, forHTTPHeaderField: WebServiceConstants.Headers.headerName)
        }
        
        if Environment.currentEnviroment != String.productionEnv {
            urlReq.setValue(WebServiceConstants.Headers.cookieValue, forHTTPHeaderField: WebServiceConstants.Headers.cookieName)
        }
        
        return urlReq
    }
}
