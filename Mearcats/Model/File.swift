//
//  File.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import Foundation
import ObjectMapper

class TokenResult: Mappable {
    var result: Bool = false
    var msg: String = ""
    var token: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        result <- map["result"]
        msg <- map["msg"]
        token <- map["token"]
    }
}
