//
//  VenuesListRepository.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 28.09.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import Foundation
import RxAlamofire
import Alamofire
import RxSwift

protocol VenuesRepositoryProtocol {
    
    func loadVenueRecommendationsWithLocation(_ location: String) -> Observable<[Venue]>
}

extension Repository: VenuesRepositoryProtocol {
    
    func loadVenueRecommendationsWithLocation(_ location: String) -> Observable<[Venue]> {
        
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

                return Observable.of(groupItems)
            })
    }
}
