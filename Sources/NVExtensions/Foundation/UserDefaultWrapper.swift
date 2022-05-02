//
//  UserDefaultWrapper.swift
//  NVExtensions
//
//  Created by Vinh Nguyen on 02/05/2022.
//

import Foundation

/*
 usage:

 ```swift

 extension UserDefaults {
    // swiftlint:disable:next force_unwrapping
    static let groupUserDefaults = UserDefaults(suiteName: "group.com.vinhnx.Clendar")!

    @UserDefault(key: "defaultCalendarName", defaultValue: AppInfo.appName)
    static var defaultCalendarName: String
 }

 ```
 */

@propertyWrapper
/// UserDefault property wrapper
public struct UserDefault<Value> {
    let key: String
    let defaultValue: Value

    // If using group UserDefaults container: `UserDefaults(suiteName: "APP_GROUP_ID")!`
    let container: UserDefaults = .standard

    public var wrappedValue: Value {
        get { container.object(forKey: key) as? Value ?? defaultValue }
        set { container.set(newValue, forKey: key) }
    }

    public var projectedValue: UserDefault<Value> { self }
}
