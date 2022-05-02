//
//  WorkItem.swift
//  NVExtensions
//
//  Created by Vinh Nguyen on 02/05/2022.
//

import Foundation

/// Custom work item to help dispatch work more properly.
/// Also known as Debouncer
/// Reference: https://www.swiftbysundell.com/posts/a-deep-dive-into-grand-central-dispatch-in-swift
public final class WorkItem {
    // MARK: Internal

    /// Helper to keep track if any work is pending, useful to cancel any previous task, for example
    var hasPendingWork: Bool {
        pendingRequestWorkItem != nil
    }

    /// Perform a closure after delay
    ///
    /// - Parameters:
    ///   - after: delay duration
    ///   - block: closure
    func perform(after: TimeInterval = 1.0, _ block: @escaping () -> Void) {
        // Cancel the currently pending item
        pendingRequestWorkItem?.cancel()

        // Wrap our request in a work item
        let requestWorkItem = DispatchWorkItem(block: block)

        // Save the new work item and execute it after delay
        pendingRequestWorkItem = requestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + after, execute: requestWorkItem)
    }

    // MARK: Private

    /// We keep track of the pending work item as a property
    private var pendingRequestWorkItem: DispatchWorkItem?
}
