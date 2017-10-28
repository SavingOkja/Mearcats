//
//  Company.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 29..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper
import Alamofire

extension HTTPManager {
    
    func getCompanies(completion: @escaping (Result<TinyCompanyResult>) -> Void) {
        
        let url = "\(baseUrlString)/mearcats/ios/company"
        let headers = header(type: .json)
        
        Alamofire.request(url,
                          method: .get,
                          headers: headers)
            .responseObject { (response: DataResponse<TinyCompanyResult>) in
                completion(response.result)
        }
    }
    
    func getCompany(with id: Int,
                    completion: @escaping (Result<CompanyResult>) -> Void) {
        
        let url = "\(baseUrlString)/mearcats/ios/company?id=\(id)"
        let headers = header(type: .json)
        
        Alamofire.request(url,
                          method: .get,
                          headers: headers)
            .responseObject { (response: DataResponse<CompanyResult>) in
                completion(response.result)
        }
    }
}

