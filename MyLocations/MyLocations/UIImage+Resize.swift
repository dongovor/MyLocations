//
//  UIImage+Resize.swift
//  MyLocations
//
//  Created by Dmitry Cherkasov on 5/14/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//

import UIKit

extension UIImage {
    func resizedImage(withBounds bounds: CGSize) -> UIImage {
        let horizontalRation = bounds.width / size.width
        let verticalRatio = bounds.height / size.height
        let ratio = min(horizontalRation, verticalRatio)
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
