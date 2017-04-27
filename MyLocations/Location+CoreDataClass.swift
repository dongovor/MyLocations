//
//  Location+CoreDataClass.swift
//  MyLocations
//
//  Created by Dmitry Cherkasov on 4/17/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//  swiftlint:disable missing_docs
//

import Foundation
import CoreData
import MapKit

@objc(Location)

class Location: NSManagedObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    var title: String? {
        if locationDescription.isEmpty {
            return("No Description")
        } else {
            return locationDescription
        }
    }
    var subtitle: String? {
        return category
    }
}
