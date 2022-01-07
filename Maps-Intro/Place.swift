//
//  Place.swift
//  Maps-Intro
//
//  Created by David Svensson on 2022-01-07.
//

import Foundation
import CoreLocation

struct Place : Identifiable {
    var id = UUID()
    
    var name : String
    var latitude : Double
    var longitude : Double
    
    var coordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}

