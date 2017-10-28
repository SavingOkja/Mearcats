//
//  HTTPManager.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import Foundation

var baseUrlString: String = "http://35.199.171.150"

class HTTPManager {
    
    static let shared = HTTPManager()
    
    public init() {}
    
    public typealias HTTPHeader = [String: String]
    
    public enum HTTPType {
        case json
        case url
        case none
    }
    
    public enum ServiceResult {
        case success
        case failure
    }
    
    /// Preventing Post CSRF error
    /// Reference: https://stackoverflow.com/questions/13485035/csrf-token-in-django-and-ios
    fileprivate func resetCookies() {
        let cookies = HTTPCookieStorage.shared.cookies(for: URL(string:baseUrlString)!)
        cookies?.forEach { cookie in HTTPCookieStorage.shared.deleteCookie(cookie) }
    }
    
    /// Basic header creator for request.
    public func header(type: HTTPType) -> HTTPHeader {
        
        resetCookies()
        var headers: HTTPHeader = HTTPHeader()
        
        switch type {
        case .json: headers["Content-Type"] = "application/json"
        case .url:  headers["Content-Type"] = "application/x-www-form-urlencoded"
        case .none: break
        }
        
        return headers
    }
}

