//
//  ObjectMapper+RealmList.swift
//  FoursquareClientSwift
//
//  Created by ikazakov on 03.10.2018.
//  Copyright © 2018 ikazakov. All rights reserved.
//

import ObjectMapper
import RealmSwift

/// Maps object of Realm's List type
func <- <T: Mappable>(left: List<T>, right: Map)
{
    var array: [T]?
    
    if right.mappingType == .toJSON {
        array = Array(left)
    }
    
    array <- right
    
    if right.mappingType == .fromJSON {
        if let theArray = array {
            left.append(objectsIn: theArray)
        }
    }
}
