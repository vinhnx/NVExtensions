//
//  UIFont+Extensions.swift
//  NVExtensions
//
//  Created by Vinh Nguyen on 02/05/2022.
//

import UIKit

extension UIFont {
    public static func registerCustom(fileName: String, fileExtension: String, bundle: Bundle = .main) {
        guard
            let url = bundle.url(forResource: fileName, withExtension: fileExtension),
            let data = try? Data(contentsOf: url),
            let provider = CGDataProvider(data: data as CFData),
            let ref = CGFont(provider)
        else {
            return
        }

        var errorRef: Unmanaged<CFError>? = nil
        if !CTFontManagerRegisterGraphicsFont(ref, &errorRef) {
            print(errorRef as Any)
        }
    }
}
