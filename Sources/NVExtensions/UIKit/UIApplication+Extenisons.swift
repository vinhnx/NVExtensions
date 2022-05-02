//
//  UIApplication+Extenisons.swift
//  NVExtensions
//
//  Created by Vinh Nguyen on 02/05/2022.
//

import UIKit

extension UIApplication {
    public static var window: UIWindow? {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        return windowScene?.windows.first
    }
}
