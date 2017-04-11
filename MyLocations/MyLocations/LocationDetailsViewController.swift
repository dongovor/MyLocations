//
//  LocationDetailsViewController.swift
//  MyLocations
//
//  Created by Dmitry Cherkasov on 4/10/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//

import UIKit
import CoreLocation

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()

class LocationDetailsViewController: UITableViewController {
    //
    var coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    var placemark: CLPlacemark?
    //---------
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    @IBAction func done() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.text = " "
        categoryLabel.text = " "
        latitudeLabel.text = String(format: "%.8f", coordinate.latitude)
        longitudeLabel.text = String(format: "%.8f", coordinate.longitude)

        if let placemark = placemark {
            addressLabel.text = string(from: placemark)
        } else {
            addressLabel.text = "No Adress Found"
        }
        dateLabel.text = format(date: Date())
    }

    func string(from placemark: CLPlacemark) -> String {
        var text = " "
        if let s = placemark.subThoroughfare { text += s + " " }
        if let s = placemark.thoroughfare { text += s + ", " }
        if let s = placemark.locality { text += s + ", " }
        if let s = placemark.administrativeArea { text += s + " " }
        if let s = placemark.postalCode { text += s + ", " }
        if let s = placemark.country { text += s }
        return text
    }

    func format(date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}
