//
//  MemberAPI.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper
import Alamofire

extension HTTPManager {
    
    public func login(with fbtoken: String,
                      imageURL: String,
                      completion: @escaping (Result<TokenResult>) -> Void) {
        
        let url = "\(baseUrlString)/mearcats/ios/member"
        let headers = header(type: .json)
        let params = [
            "facebookToken":fbtoken,
            "img": imageURL
        ]
        
        Alamofire.request(url,
                          method: .post,
                          parameters: params,
                          encoding: JSONEncoding.default,
                          headers: headers)
            .responseObject { (response: DataResponse<TokenResult>) in
                completion(response.result)
        }
    }
    
    public func getMember(with token: Int,
                          completion: @escaping (Result<MemberResult>) -> Void) {
        
        let url = "\(baseUrlString)/mearcats/ios/member?id=\(token)"
        let headers = header(type: .json)
        
        Alamofire.request(url,
                          method: .get,
                          headers: headers)
            .responseObject { (response: DataResponse<MemberResult>) in
                completion(response.result)
        }
        
    }
}
