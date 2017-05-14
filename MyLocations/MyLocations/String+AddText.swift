//
//  String+AddText.swift
//  MyLocations
//
//  Created by Dmitry Cherkasov on 5/14/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//

extension String {
    mutating func add(text: String?, separatedBy separator: String = "") {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
}
