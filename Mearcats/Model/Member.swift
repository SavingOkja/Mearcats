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
    var member: [Member]?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        result <- map["result"]
        msg <- map["msg"]
        member <- map["data"]
    }
}

class Member: Mappable {
    var img: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        img <- map["img"]
    }
}
