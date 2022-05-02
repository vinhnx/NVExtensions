//
//  Array+Extensions.swift
//  NVExtensions
//
//  Created by Vinh Nguyen on 24/3/19.
//  Copyright © 2019 Vinh Nguyen. All rights reserved.
//

import Foundation

extension Array where Element == String {
    public var commonText: String {
        var result = [String]()

        for loop in enumerated() {
            let lhs = loop.element

            guard let rhs = self[safe: loop.offset + 1] else {
                result.append(lhs)
                break
            }

            let sharedText = lhs.commonPrefix(with: rhs, options: .caseInsensitive)
            result.append(sharedText)
        }

        return result.first ?? ""
    }
}

extension Array where Element: Hashable {
    public var asSet: Set<Element> { Set(self) }
}
