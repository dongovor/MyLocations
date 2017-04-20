//
//  Functions.swift
//  MyLocations
//
//  Created by Dmitry Cherkasov on 4/12/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//  swiftlint:disable force_cast
//

import Foundation
import Dispatch

func afterDelay(_ seconds: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: closure)
}

let applicationDocumentsDirectory: URL = {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}()

let myManagedObjectContextSaveDidFailNotification = Notification.Name(rawValue: "MyManagedObjectContextSaveDidFailNotification")
func fatalCoreDataError(_ error: Error) {
    print("*** Fatal error: \(error)")
    NotificationCenter.default.post(name: myManagedObjectContextSaveDidFailNotification, object: nil)
}
