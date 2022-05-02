//
//  String+Extensions.swift
//  NVExtensions
//
//  Created by Vinh Nguyen on 24/3/19.
//  Copyright © 2019 Vinh Nguyen. All rights reserved.
//

import Foundation
import UIKit

extension String {
    public func trim(text: String) -> String {
        replacingOccurrences(of: text, with: "", options: .literal)
    }

    /// Return a new string with first letter being capitalized
    var capitalizedFirstLetter: String {
        guard !isEmpty else {
            return ""
        }

        return "\(prefix(1).uppercased())\(dropFirst())"
    }

    /// Return a localized string using NSLocalizedString
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    public var toData: Data {
        return Data(self.utf8)
    }

    public var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }

    public func hasPattern(regex: String) -> Bool {
        return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }

    public func containsIgnoringCase(_ find: String) -> Bool {
        return self.range(of: find, options: .caseInsensitive) != nil
    }

    public func trimmingInsideSmartQuotes() -> String {
        return self.replacingOccurrences(of: #"“\S*”"#, with: "", options: .regularExpression).trimmed
    }

    public func trimmingInsideParenthesis() -> String {
        return self.replacingOccurrences(of: #"\(\S*\)"#, with: "", options: .regularExpression).trimmed
    }

    public func trimmingInsideAsterisks() -> String {
        return self.replacingOccurrences(of: #"\*\S*\*"#, with: "", options: .regularExpression).trimmed
    }

    public func trimmingInsideQuotes() -> String {
        return self.replacingOccurrences(of: #"\"\S*\""#, with: "", options: .regularExpression).trimmed
    }

    /// Check whether self contains any element in the array
    public func contains(anyIn array: [String]) -> Bool {
        return array.contains(where: self.contains)
    }

    public func parseInt() -> Int? {
        // ref: https://stackoverflow.com/questions/30342744/swift-how-to-get-integer-from-string-and-convert-it-into-integer
        Int(components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
    }

    public var asImage: UIImage? { UIImage(named: self) }
}

// https://github.com/vincent-pradeilles/swift-tips#shorter-syntax-to-deal-with-optional-strings
extension Optional where Wrapped == String {
    public var orEmpty: String {
        switch self {
        case let .some(value):
            return value
        case .none:
            return ""
        }
    }
}
