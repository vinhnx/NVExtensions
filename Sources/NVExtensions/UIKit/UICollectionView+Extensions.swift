//
//  UICollectionView+Extensions.swift
//  NVExtensions
//
//  Created by Vinh Nguyen on 02/05/2022.
//

import UIKit

// reference: https://github.com/onmyway133/Omnia/blob/master/Sources/iOS/UICollectionView.swift

extension UICollectionView {

    /// Register a cell
    ///
    /// - Parameter cell: The type of the cell
    public func register<T: UICollectionViewCell>(cellType: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: T.self))
    }

    /// Dequeue a cell
    ///
    /// - Parameter indexPath: The indexPath to dequeue
    /// - Returns: The dequeued cell
    public func dequeue<T: UICollectionViewCell>(for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(
            withReuseIdentifier: String(describing: T.self),
            for: indexPath
        ) as? T
    }

}
