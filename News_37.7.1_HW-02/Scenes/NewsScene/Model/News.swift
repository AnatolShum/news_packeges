//
//  News.swift
//  News_37.7.1_HW-02
//
//  Created by Anatolii Shumov on 21/06/2023.
//

import Foundation
import UIKit
import Alamofire
import ObjectMapper

struct News: Mappable {
    var title: String?
    var description: String?
    var url: String?

    init?(map: Map) { }
    
    mutating func mapping(map: ObjectMapper.Map) {
        title <- map["title"]
        description <- map["description"]
        url <- map["urlToImage"]
    }
    
}
