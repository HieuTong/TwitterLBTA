//
//  Service.swift
//  TwitterLBTA
//
//  Created by HieuTong on 1/11/21.
//  Copyright © 2021 HieuTong. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    static let shareInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDataSource?, Error?)->()) {
        let request: APIRequest<HomeDataSource, JSONError> = tron.swiftyJSON.request("/twitter/home")
        request.perform(withSuccess: { (homeDatasource) in
            completion(homeDatasource, nil)
        }) { (err) in
            completion(nil, err)
        }
    }
    
    class JSONError: JSONDecodable {
           required init(json: JSON) throws {
               print("JSON Error")
           }
       }
}
