//
//  Date+Extensions.swift
//  NVExtensions
//
//  Created by Vinh Nguyen on 31/3/19.
//  Copyright © 2019 Vinh Nguyen. All rights reserved.
//

import Foundation
import SwiftDate

extension Date {
    public var startDate: Date {
        dateAtStartOf(.day)
    }

    public var endDate: Date {
        dateAtEndOf(.day)
    }

    public func toHourAndMinuteString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(
            self,
            format: "HH:mm",
            calendar: calendar
        )
    }

    public func toShortDateString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "d", calendar: calendar)
    }

    public func toDateString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "d", calendar: calendar)
    }

    public func toDateAndMonthString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "MMM d", calendar: calendar)
    }

    public func toDayString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "E", calendar: calendar)
    }

    public func toMonthString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "MMMM", calendar: calendar)
    }

    public func toMonthAndYearString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "MMMM yyyy", calendar: calendar)
    }

    public func toYearString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "yyyy", calendar: calendar)
    }

    public func toFullDateString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "EEEE, MMM d, yyyy", calendar: calendar)
    }

    public func toFullDayString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "EEEE", calendar: calendar)
    }

    public func toDayAndDateString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "EEEE d", calendar: calendar)
    }

    public func asStringWithTemplate(_ format: String, calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: format, calendar: calendar)
    }

    public var nextHour: Date {
        dateByAdding(1, .hour).dateAtStartOf(.hour).date
    }

    public func toFullEventDate(calendar: Calendar = .autoupdatingCurrent) -> String {
        let format = String("EEEE, MMM d, yyyy. HH:mm")
        return DateFormatter.asString(self, format: format, calendar: calendar)
    }
    
    public func second(calendar: Calendar = .current) -> Int {
        return calendar.component(.second, from: self)
    }

    public func minute(calendar: Calendar = .current) -> Int {
        return calendar.component(.minute, from: self)
    }

    public func hour(calendar: Calendar = .current) -> Int {
        return calendar.component(.hour, from: self)
    }

    public func day(calendar: Calendar = .current) -> Int{
        return calendar.component(.day, from: self)
    }

    public func month(calendar: Calendar = .current) -> Int {
        return calendar.component(.month, from: self)
    }

    public func year(calendar: Calendar = .current) -> Int {
        return calendar.component(.year, from: self)
    }

    public func weekday(calendar: Calendar = .current) -> Int {
        return calendar.component(.weekday, from: self)
    }
}
