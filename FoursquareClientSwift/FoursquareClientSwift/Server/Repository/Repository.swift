//
//  Repository.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 26.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit

class Repository: NSObject {
    
    static let shared = Repository()
    
    let baseURL = "https://api.foursquare.com/v2/"
    let clientId = "IGHIZ4HGE241PW53BP1JGIYEGD331WPFBMBIAWWVPBORM1WR"
    let clientSecret = "VQIS3F345XFQRHR004RS2BA4QY2ZG5SEFRFCH4KTSKGXCZUV"
    let versionApi = "20180323"
    let radius = 500.0
    
    // MARK: - Init
    private override init() {
        super.init()
    }
    
    // MARK: - Public methods
    
    
}


