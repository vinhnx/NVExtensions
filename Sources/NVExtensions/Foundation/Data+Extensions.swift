//
//  Data+Extensions.swift
//  NVExtensions
//
//  Created by Vinh Nguyen on 02/05/2022.
//

import Foundation

public extension Data {
    func toString() -> String {
        String(decoding: self, as: UTF8.self)
    }
}
