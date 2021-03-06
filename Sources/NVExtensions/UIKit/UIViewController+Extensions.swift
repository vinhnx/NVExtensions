//
//  UIViewController+Extensions.swift
//  NVExtensions
//
//  Created by Vinh Nguyen on 24/3/19.
//  Copyright © 2019 Vinh Nguyen. All rights reserved.
//

import UIKit

extension UIViewController {


    // MARK: - Container

    /// Add child view controller from container view
    ///
    /// - Parameters:
    ///   - childViewController: child view controller
    ///   - containerView: container view
    public func addChildViewController(_ childViewController: UIViewController, containerView: UIView) {
        addChild(childViewController)
        containerView.addSubview(childViewController.view)

        containerView.translatesAutoresizingMaskIntoConstraints = false
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            childViewController.view.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            childViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            childViewController.view.rightAnchor.constraint(equalTo: containerView.rightAnchor)
        ])

        childViewController.didMove(toParent: self)
    }

    /// Remove self from parent view controller
    public func removeFromParentViewController() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }

    /// Exchange/swap two controllers
    ///
    /// - Parameters:
    ///   - viewControllerA: the view controller to be exchanged
    ///   - viewControllerB: the view controller to exchange to
    ///   - containerView: container view to place viewControllerB
    ///   - rootViewController: the root view controller
    public func exchangeViewControllerA(_ viewControllerA: UIViewController?, with viewControllerB: UIViewController?, containerView: UIView?, on rootViewController: UIViewController) {
        guard let viewControllerA = viewControllerA else { return }
        guard let viewControllerB = viewControllerB else { return }
        guard let containerView = containerView else { return }
        viewControllerA.removeFromParentViewController()
        rootViewController.addChildViewController(viewControllerB, containerView: containerView)
    }

    static public func topViewController(_ baseViewController: UIViewController?) -> UIViewController? {
        if baseViewController is UINavigationController {
            return topViewController((baseViewController as? UINavigationController)?.visibleViewController)
        }

        if baseViewController is UITabBarController {
            return topViewController((baseViewController as? UITabBarController)?.selectedViewController)
        }

        if baseViewController is UISplitViewController {
            return topViewController((baseViewController as? UISplitViewController)?.viewControllers.first)
        }

        if baseViewController?.presentedViewController != nil {
            return topViewController(baseViewController?.presentedViewController)
        }

        return baseViewController
    }

    static var topViewController: UIViewController? {
        UIViewController.topViewController(UIApplication.window?.rootViewController)
    }

    /// Safe present view controller
    ///
    /// - Parameter completion: completion handler
    public func safeDismiss(_ completion: @escaping (() -> Void)) {
        guard isBeingDismissed else { return }
        dismiss(animated: true, completion: completion)
    }

    // MARK: - Others

    public func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc public func dimissModal() {
        view.endEditing(true)
        dismiss(animated: true)
    }
}
