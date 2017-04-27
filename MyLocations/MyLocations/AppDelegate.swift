//
//  AppDelegate.swift
//  MyLocations
//
//  Created by Dmitry Cherkasov on 3/28/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//  swiftlint:disable force_cast
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: {
            _, error in
            if let error = error {
                fatalError("Could load data store: \(error)")
            }
        })
        return container
    }()

    lazy var managedObjectContext: NSManagedObjectContext = self.persistentContainer.viewContext

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let tabBarController = window!.rootViewController as! UITabBarController
        if let tabBarViewControllers = tabBarController.viewControllers {
            let mapViewController = tabBarViewControllers[2] as! MapViewController
            mapViewController.managedObjectContext = managedObjectContext
            let navigationController = tabBarViewControllers[1] as! UINavigationController
            let locationsViewController = navigationController.viewControllers[0] as! LocationsViewController
            let currentLocationViewController = tabBarViewControllers[0] as! CurrentLocationViewController
            currentLocationViewController.managedObjectContext = managedObjectContext
            locationsViewController.managedObjectContext = managedObjectContext
        }
        print(applicationDocumentsDirectory)
        listenForFatalCoreDataNotifications()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

    func listenForFatalCoreDataNotifications() {
        NotificationCenter.default.addObserver( forName: myManagedObjectContextSaveDidFailNotification,
                                                object: nil, queue: OperationQueue.main, using: { _ in
        let alert = UIAlertController(title: "Internal Error",
                                      message: "There was a fatal error in the app and it cannot continue. \n\n" +
                                                    "Press OK to terminate the app. Sorry for the inconvenience",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            let exception = NSException(
                name: NSExceptionName.internalInconsistencyException,
                reason: "Fatal Core Data error", userInfo: nil)
            exception.raise()
            }
        alert.addAction(action)
        self.viewControllerForShowingAlert().present(alert, animated: true, completion: nil)
      })
    }

    func viewControllerForShowingAlert() -> UIViewController {
        let rootViewController = self.window!.rootViewController!
        if let presentedViewController = rootViewController.presentedViewController {
            return presentedViewController
        } else {
            return rootViewController
        }
    }

}
