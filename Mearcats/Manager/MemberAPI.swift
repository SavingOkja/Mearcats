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
    
    public func getMembers(completion: @escaping (Result<AllAlbums>) -> Void) {
        
        let url = "\(baseUrlString)/history/student/album/main/"
        let headers = header(type: .json)
        
        Alamofire.request(url,
                          method: .get,
                          headers: headers)
            .responseObject { (response: DataResponse<AllAlbums>) in
                completion(response.result)
        }
        
    }
}
