//
//  Control.swift
//  KZRazor
//
//  Created by zzzwco on 2021/9/19.
//
//  Copyright (c) 2021 zzzwco <zzzwco@outlook.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import UIKit

public typealias KZControl = UIControl

// MARK: - Control’s Attributes

public extension KZWrapper where T: KZControl {
  
  @discardableResult
  func isEnabled(_ isEnabled: Bool) -> T {
    base.isEnabled = isEnabled
    return base
  }
  
  @discardableResult
  func isSelected(_ isSelected: Bool) -> T {
    base.isSelected = isSelected
    return base
  }
  
  @discardableResult
  func isHighlighted(_ isHighlighted: Bool) -> T {
    base.isHighlighted = isHighlighted
    return base
  }
}

// MARK: - Actions

public extension KZWrapper where T: KZControl {
  
  @discardableResult
  func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) -> T {
    base.addTarget(target, action: action, for: controlEvents)
    return base
  }
  
  @discardableResult
  func removeTarget(_ target: Any?, action: Selector?, for controlEvents: UIControl.Event) -> T {
    base.removeTarget(target, action: action, for: controlEvents)
    return base
  }
  
  @discardableResult
  func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) -> T {
    base.sendAction(action, to: target, for: event)
    return base
  }
}
