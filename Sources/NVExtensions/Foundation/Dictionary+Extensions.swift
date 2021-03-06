//
//  Dictionary+Extensions.swift
//  NVExtensions
//
//  Created by Vinh Nguyen on 25/3/19.
//  Copyright © 2019 Vinh Nguyen. All rights reserved.
//

import Foundation

public typealias TypedUserInfoKey<T> = (key: String, type: T.Type)

extension Dictionary where Key == String, Value == Any {
    public subscript<T>(_ typedKey: TypedUserInfoKey<T>) -> T? {
        self[typedKey.key] as? T
    }
}

// MARK: - Extensions

extension Dictionary where Key == String {
    // MARK: - Helper
    
    /// Find value for key in-sensitive search, eg: "FooBar","fooBar","FOOBAR","FoOBaR"...
    ///
    /// - Parameter key: key
    /// - Returns: value
    public func valueForKeyInsensitive<T>(key: Key) -> T? {
        let foundKey = keys.first { $0.compare(key, options: .caseInsensitive) == .orderedSame } ?? key // IMPORTANT: fallback to original key if search failed
        return self[foundKey] as? T
    }
    
    /// Merge two dictionaries, reference: https://stackoverflow.com/a/26728685/1477298
    mutating public func merge(dict: [Key: Value]) {
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
    
    /// Array for key
    ///
    /// - Parameter key: key
    /// - Returns: value
    public func arrayFor<T>(key: Key) -> [T] {
        valueForKeyInsensitive(key: key) ?? [T]()
    }
    
    /// Dictionary for key
    ///
    /// - Parameter key: key
    /// - Returns: dictionary
    public func dictionaryFor(key: Key) -> [String: Any] {
        valueForKeyInsensitive(key: key) ?? [String: Any]()
    }
    
    /// Subscript
    ///
    /// - Parameter key: the key
    /// - Returns: value subscript
    public func valueFor<T>(key: Key) -> T? {
        valueForKeyInsensitive(key: key)
    }
    
    /// String subscript
    ///
    /// - Parameter key: the key
    /// - Returns: value subscript, cast as String
    public func stringFor(key: Key) -> String {
        valueForKeyInsensitive(key: key).orEmpty
    }
    
    /// String subscript
    ///
    /// - Parameter key: the key
    /// - Returns: value subscript, cast as Int
    public func intFor(key: Key) -> Int {
        valueForKeyInsensitive(key: key) ?? 0
    }
    
    /// Double for key
    ///
    /// - Parameter key: key
    /// - Returns: value
    public func doubleFor(key: Key) -> Double {
        valueForKeyInsensitive(key: key) ?? 0.0
    }
    
    /// Float for key
    ///
    /// - Parameter key: key
    /// - Returns: value
    public func floatFor(key: Key) -> Float {
        valueForKeyInsensitive(key: key) ?? 0.0
    }
    
    /// Pretty dictionary
    public func prettyPrint() {
        do {
            let _serialized = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            print(String(data: _serialized, encoding: .utf8) ?? description)
        } catch {
            print(error)
        }
    }
    
    /// Remove empty string from dictionary, useful for analytics
    ///
    /// - Returns: A filtered dictionary
    public func filterEmptyStringValue() -> [Key: Value] {
        filter { (_, value) -> Bool in
            if value is String {
                return ((value as? String) ?? "").isEmpty == false
            }
            
            return true
        }
    }
    
    public var toData: Data? {
        guard JSONSerialization.isValidJSONObject(self) else {
            print("invalid json: \(self)")
            return nil
        }
        
        do {
            return try JSONSerialization.data(withJSONObject: self, options: [])
        } catch {
            print(error)
            return nil
        }
    }
    
    public var toString: String {
        description
    }
}
