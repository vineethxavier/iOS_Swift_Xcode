//
//  pinAnnotation.swift
//  mapKitDecodable
//
//  Created by Vineeth Xavier on 10/12/17.
//  Copyright © 2017 Vineeth Xavier. All rights reserved.
//

import Foundation
import MapKit

class pinAnnotation: NSObject,MKAnnotation {
    var title:String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(Title:String, subTitle:String, coOrdinate:CLLocationCoordinate2D) {
        self.title = Title
        self.subtitle = subTitle
        self.coordinate = coOrdinate
    }
}
