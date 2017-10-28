//
//  Member.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import Foundation
import ObjectMapper

class MemberResult: Mappable {
    var result: Bool = false
    var msg: String = ""
    var data: [Member]?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        result <- map["result"]
        msg <- map["msg"]
        data <- map["data"]
    }
}

class Member: Mappable {
    var name: String = ""
    var id: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
    }
}
