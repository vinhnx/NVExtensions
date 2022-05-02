//
//  UITableView+Extensions.swift
//  NVExtensions
//
//  Created by Vinh Nguyen on 02/05/2022.
//

import UIKit

// reference: https://github.com/onmyway133/Omnia/blob/master/Sources/iOS/UITableView.swift

public extension UITableView {
    /// Register a cell
    ///
    /// - Parameter cell: The type of the cell
    public func register<T: UITableViewCell>(cellType: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }

    /// Dequeue a cell
    ///
    /// - Parameter indexPath: The indexPath to dequeue
    /// - Returns: The dequeued cell
    public func dequeue<T: UITableViewCell>(for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(
            withIdentifier: String(describing: T.self),
            for: indexPath
        ) as? T
    }
}
