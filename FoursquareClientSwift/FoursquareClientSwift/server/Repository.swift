//
//  Repository.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 26.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import UIKit
import RxAlamofire
import Alamofire
import AlamofireObjectMapper
//import ObjectMapper
import RxSwift

class Repository: NSObject {
    
    static let shared = Repository()
    
    private let baseURL = "https://api.foursquare.com/v2/"
    private let clientId = "IGHIZ4HGE241PW53BP1JGIYEGD331WPFBMBIAWWVPBORM1WR"
    private let clientSecret = "VQIS3F345XFQRHR004RS2BA4QY2ZG5SEFRFCH4KTSKGXCZUV"
    private let versionApi = "20180323"
    private let radius = 500.0
    
    // MARK: - Init
    private override init() {
        super.init()
    }
    
    // MARK: - Public methods
    
    func loadVenueRecommendations() -> Observable<[Venue]> {
        
        let url = URL(string: "\(baseURL)venues/explore?")!
        let params: [String : Any] = ["client_id": clientId,
                      "client_secret": clientSecret,
                      "radius": radius,
                      "ll": "47.217755, 38.925444",
                      "v": versionApi]
        
        return json(.get, url, parameters: params, encoding: URLEncoding.default, headers: nil)
            .mapObject(type: RecommendationsResponse.self)
            .flatMap({ (response) -> Observable<[Venue]> in
                
                guard let group = response.groups?.first,
                    let groupItems = group.items else {
                    return Observable.empty()
                }
                
                var venues = [Venue]()
                for itemVenue in groupItems {
                    venues.append(itemVenue)
                }
                
                return Observable.of(venues)
            })
        
//            .subscribe { event in
//                switch event {
//                case .next(let value):
//                    print(value)
//                case .error(let error):
//                    print(error)
//                case .completed:
//                    print("")
//                }
//            }

    }
}


