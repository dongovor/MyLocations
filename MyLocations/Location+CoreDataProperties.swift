//
//  Location+CoreDataProperties.swift
//  MyLocations
//
//  Created by Dmitry Cherkasov on 4/17/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//  swiftlint:disable missing_docs
//

import Foundation
import CoreData
import CoreLocation

extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var date: Date
    @NSManaged public var locationDescription: String
    @NSManaged public var category: String
    @NSManaged public var placemark: CLPlacemark?
    @NSManaged var photoID: NSNumber?

}
