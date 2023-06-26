//
//  Articles.swift
//  News_37.7.1_HW-02
//
//  Created by Anatolii Shumov on 21/06/2023.
//

import Foundation
import UIKit
import Alamofire
import ObjectMapper

struct Articles: Mappable {
    var articles: [News]?
    
    init?(map: Map) { }
    
    mutating func mapping(map: ObjectMapper.Map) {
        articles <- map["articles"]
    }
}
