//
//  Optional+Extensions.swift
//  NVExtensions
//
//  Created by Vinh Nguyen on 02/05/2022.
//

import Foundation

extension Optional where Wrapped == String {
    public var isNilOrEmpty: Bool {
        if let unwrapped = self {
            return unwrapped.isEmpty
        } else {
            return true
        }
    }
}
