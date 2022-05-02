//
//  UIDatePicker+Extensions.swift
//  NVExtensions
//
//  Created by Vĩnh Nguyễn on 10/28/20.
//  Copyright © 2020 Vinh Nguyen. All rights reserved.
//

import UIKit

public extension UIDatePicker {
    func configurePreferredDatePickerStyle() {
        if #available(iOS 13.4, *) {
            preferredDatePickerStyle = .automatic
        }
    }
}
