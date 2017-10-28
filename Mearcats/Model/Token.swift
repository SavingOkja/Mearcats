//
//  Token.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 28..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import Foundation
import ObjectMapper
import Realm
import RealmSwift

class TokenResult: Object, Mappable{
    @objc dynamic var result: Bool = false
    @objc dynamic var msg: String = ""
    @objc dynamic var token: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        result <- map["result"]
        msg <- map["msg"]
        token <- map["data"]
    }
}
