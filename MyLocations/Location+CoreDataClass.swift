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
    var hasPhoto: Bool {
        return photoID != nil
    }
    var photoURL: URL {
        assert(photoID != nil, "No photo ID set")
        let filename = "Photo-\(photoID!.intValue).jpg"
        return applicationDocumentsDirectory.appendingPathComponent(filename)
    }
    var photoImage: UIImage? {
        return UIImage(contentsOfFile: photoURL.path)
    }
    class func nextPhotoID() -> Int {
        let userDefaults = UserDefaults.standard
        let currentID = userDefaults.integer(forKey: "PhotoID")
        userDefaults.set(currentID + 1, forKey: "PhotoID")
        userDefaults.synchronize()
        return currentID
    }
    func removePhotoFile() {
        if hasPhoto {
            do {
                try FileManager.default.removeItem(at: photoURL)
            } catch {
                print("Error removing file \(error)")
            }
        }
    }
}
