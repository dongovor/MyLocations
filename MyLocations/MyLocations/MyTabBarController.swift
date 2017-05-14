//
//  MyTabBarController.swift
//  MyLocations
//
//  Created by Dmitry Cherkasov on 5/14/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var childViewControllerForStatusBarStyle: UIViewController? {
        return nil
    }
}
