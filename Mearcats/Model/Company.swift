//
//  Company.swift
//  Mearcats
//
//  Created by 손은주 on 2017. 10. 29..
//  Copyright © 2017년 SavingOkja. All rights reserved.
//

import Foundation
import ObjectMapper

class CompanyResult: Mappable {
    var result: Bool = false
    var msg: String = ""
    var companies: [Company] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        result <- map["result"]
        msg <- map["msg"]
        companies <- map["company"]
    }
}

class Company: Mappable {
    var id: Int = 0
    var name: String = ""
    var imageURL: String = ""
    var kinds: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        imageURL <- map["img_url"]
        kinds <- map["kinds"]
    }
}

class TinyCompanyResult: Mappable {
    var result: Bool = false
    var msg: String = ""
    var companies: [TinyCompany] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        result <- map["result"]
        msg <- map["msg"]
        companies <- map["data"]
    }
}

class TinyCompany: Mappable {
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
