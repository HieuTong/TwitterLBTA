//
//  Tweet.swift
//  TwitterLBTA
//
//  Created by HieuTong on 1/10/21.
//  Copyright © 2021 HieuTong. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct Tweet: JSONDecodable{
    let user: User
    let message: String
    
    init(json: JSON) {
        self.user = User(json: json["user"])
        self.message = json["message"].stringValue
    }
}
