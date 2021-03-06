//
//  DateFormatter+Extensions.swift
//  NVExtensions
//
//  Created by Vinh Nguyen on 10/20/20.
//  Copyright © 2020 Vinh Nguyen. All rights reserved.
//

import Foundation
import SwiftDate

extension DateFormatter {
	public static func lunarDateString(
		forDate date: Date = Date(),
		dateFormat: String = "dd/MM"
	) -> String {
		let dateFormater = DateFormatter()
		dateFormater.locale = Locales.vietnamese.toLocale()
		dateFormater.dateFormat = dateFormat
		dateFormater.calendar = Calendar(identifier: .chinese)
		return dateFormater.string(from: date)
	}

    public static func asString(
        _ date: Date,
        format: String,
        calendar: Calendar = .autoupdatingCurrent
    ) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.setLocalizedDateFormatFromTemplate(format)
        dateFormatter.calendar = calendar
		return dateFormatter.string(from: date)
	}
}
