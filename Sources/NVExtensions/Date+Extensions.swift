//
//  Date+Extensions.swift
//  Clendar
//
//  Created by Vinh Nguyen on 31/3/19.
//  Copyright © 2019 Vinh Nguyen. All rights reserved.
//

import Foundation
import SwiftDate

extension Date {
    var startDate: Date {
        dateAtStartOf(.day)
    }

    var endDate: Date {
        dateAtEndOf(.day)
    }

    func toHourAndMinuteString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(
            self,
            format: "HH:mm",
            calendar: calendar
        )
    }

    func toShortDateString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "d", calendar: calendar)
    }

    func toDateString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "d", calendar: calendar)
    }

    func toDateAndMonthString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "MMM d", calendar: calendar)
    }

    func toDayString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "E", calendar: calendar)
    }

    func toMonthString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "MMMM", calendar: calendar)
    }

    func toMonthAndYearString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "MMMM yyyy", calendar: calendar)
    }

    func toYearString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "yyyy", calendar: calendar)
    }

    func toFullDateString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "EEEE, MMM d, yyyy", calendar: calendar)
    }

    func toFullDayString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "EEEE", calendar: calendar)
    }

    func toDayAndDateString(calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: "EEEE d", calendar: calendar)
    }

    func asStringWithTemplate(_ format: String, calendar: Calendar = .autoupdatingCurrent) -> String {
        DateFormatter.asString(self, format: format, calendar: calendar)
    }

    var nextHour: Date {
        dateByAdding(1, .hour).dateAtStartOf(.hour).date
    }

    func toFullEventDate(calendar: Calendar = .autoupdatingCurrent) -> String {
        let format = String("EEEE, MMM d, yyyy. HH:mm")
        return DateFormatter.asString(self, format: format, calendar: calendar)
    }
}
