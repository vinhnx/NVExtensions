//
//  UIView+Extensions.swift
//  NVExtensions
//
//  Created by Vinh Nguyen on 26/3/19.
//  Copyright © 2019 Vinh Nguyen. All rights reserved.
//

import UIKit

// reference: https://github.com/onmyway133/Omnia/blob/master/Sources/iOS/UIView.swift

public extension UIView {

    // MARK: - Autolayout

    func pinCenter(view: UIView) -> [NSLayoutConstraint] {
        return [
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
    }

    func pinEdges(view: UIView, inset: UIEdgeInsets = UIEdgeInsets.zero) -> [NSLayoutConstraint] {
        return [
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset.left),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: inset.right),
            topAnchor.constraint(equalTo: view.topAnchor, constant: inset.top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: inset.bottom)
        ]
    }

    func pin(size: CGSize) -> [NSLayoutConstraint] {
        return [
            widthAnchor.constraint(equalToConstant: size.width),
            heightAnchor.constraint(equalToConstant: size.height)
        ]
    }

    func addSubViewAndFit(_ subView: UIView) {
        subView.prepareForAutolayout()
        prepareForAutolayout()
        addSubview(subView)
        subView.fitLayoutOnSuperView(self)
    }

    func prepareForAutolayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func fitLayoutOnSuperView(_ superView: UIView, insets: UIEdgeInsets = .zero) {
        prepareForAutolayout()

        let constraints: [NSLayoutConstraint]
        if #available(iOS 11.0, *) {
            constraints = [
                leftAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leftAnchor, constant: insets.left),
                topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor, constant: insets.top),
                rightAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.rightAnchor, constant: insets.right),
                bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor, constant: insets.bottom)
            ]
        }
        else {
            constraints = [
                leftAnchor.constraint(equalTo: superView.leftAnchor, constant: insets.left),
                topAnchor.constraint(equalTo: superView.topAnchor, constant: insets.top),
                rightAnchor.constraint(equalTo: superView.rightAnchor, constant: insets.right),
                bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: insets.bottom)
            ]
        }

        NSLayoutConstraint.activate(constraints)
    }

    /// Instantiate view instance from nib
    ///
    /// - Returns: a view instance
    class func fromNib<T: UIView>() -> T? {
        let nib = String(describing: T.self)
        guard let result = Bundle.main.loadNibNamed(nib, owner: nil, options: nil)?.first as? T else {
            return nil
        }

        return result
    }

    /// Style modal with corner radius
    func applyCornerRadius() {
        applyRound(4.0)
    }

    /// Make circle from view
    func applyCircle() {
        applyRound(min(frame.size.width, frame.size.height) / 2)
    }

    /// Apply round view with radius
    ///
    /// - Parameter radius: radius value
    func applyRound(_ radius: CGFloat) {
        applyRound(radius, borderColor: .clear, borderWidth: 1, addShadow: false)
    }

    /// Apply round view with radius gray color
    ///
    /// - Parameter radius: radius value
    func applyRoundGray(_ radius: CGFloat) {
        applyRound(radius, borderColor: .lightGray, borderWidth: 1, addShadow: false)
    }

    /// Apply round view shadow with offset shadow
    func applyRoundWithOffsetShadow(backgroundColor: UIColor = .white) {
        self.backgroundColor = backgroundColor
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.1
        layer.masksToBounds = false

        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 6.0
        layer.masksToBounds = false
    }

    /// Apply round view
    ///
    /// - Parameters:
    ///   - radius: radius value
    ///   - borderColor: border color
    ///   - borderWidth: border width
    ///   - addShadow: should add shadow
    func applyRound(_ radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat, addShadow: Bool, shadowOffset: CGSize) {
        if addShadow {
            layer.shadowColor = UIColor.lightGray.cgColor
            layer.shadowOffset = shadowOffset
            layer.shadowOpacity = 0.8
            layer.shadowRadius = 3.0
        }

        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = radius
        layer.masksToBounds = !addShadow
    }

    /// Apply round view
    ///
    /// - Parameters:
    ///   - radius: radius value
    ///   - borderColor: border color
    ///   - borderWidth: border width
    ///   - addShadow: should add shadow
    func applyRound(_ radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat, addShadow: Bool) {
        applyRound(radius, borderColor: borderColor, borderWidth: borderWidth, addShadow: addShadow, shadowOffset: .zero)
    }

    // MARK: - Cutout

    /// Apply cutout view mask on view
    ///
    /// - Parameter cutOutView: a view to apply
    func applyCutoutMaskWith(cutOutView: UIView) {
        let outerPath = UIBezierPath(rect: frame)

        let circlePath = UIBezierPath(ovalIn: cutOutView.frame)
        outerPath.usesEvenOddFillRule = true
        outerPath.append(circlePath)

        let maskLayer = CAShapeLayer()
        maskLayer.path = outerPath.cgPath
        maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
        maskLayer.fillColor = UIColor.white.cgColor

        layer.mask = maskLayer
    }

    /// Apply border
    ///
    /// - Parameter color: border color
    func applyBorder(color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = 1.0
        layer.masksToBounds = true
    }

    /// Remove any border
    func removeBorder() {
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 0
        layer.masksToBounds = true
    }

    /// Style with drop shadow
    func applyDropshadow() {
        applyRound(3, borderColor: UIColor.white, borderWidth: 1, addShadow: true)
    }

    /// Remove drop shadow
    func removeDropshadow() {
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 0
        layer.shadowColor = UIColor.clear.cgColor
        layer.shadowOpacity = 0
        layer.shadowRadius = 0
    }

    /// Take a snapshot of a view
    ///
    /// - Returns: The image from the snapshot
    func toImage() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        return renderer.image { _ in
            self.drawHierarchy(in: bounds, afterScreenUpdates: true)
        }
    }

    func findRecursively<T: UIView>(type: T.Type, match: (T) -> Bool) -> T? {
        for view in subviews {
            if let subview = view as? T, match(subview) {
                return subview
            } else {
                return view.findRecursively(type: type, match: match)
            }
        }

        return nil
    }
}
