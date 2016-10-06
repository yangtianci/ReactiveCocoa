//
//  NSTextField.swift
//  Rex
//
//  Created by Yury Lapitsky on 7/8/15.
//  Copyright (c) 2015 Neil Pankey. All rights reserved.
//

import ReactiveSwift
import AppKit
import enum Result.NoError

extension Reactive where Base: NSTextField {
	/// Sends the field's string value whenever it changes.
	public var textSignal: SignalProducer<String, NoError> {
		return NotificationCenter.default.reactive
			.notifications(forName: .NSControlTextDidChange, object: base)
			.map { notification in
				(notification.object as! NSTextField).stringValue
			}
	}
}
