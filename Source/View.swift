//
//  View.swift
//  KZRazor
//
//  Created by zzzwco on 2021/9/18.
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
import SnapKit

public typealias View = UIView

// MARK: - Visual Appearance

public extension KZWrapper where T: View {
  
  @discardableResult
  func backgroundColor(_ color: UIColor) -> T {
    base.backgroundColor = color
    return base
  }
  
  @discardableResult
  func isHidden(_ isHidden: Bool) -> T {
    base.isHidden = isHidden
    return base
  }
  
  @discardableResult
  func alpha(_ alpha: CGFloat) -> T {
    base.alpha = alpha
    return base
  }
  
  @discardableResult
  func tintColor(_ tintColor: UIColor!) -> T {
    base.tintColor = tintColor
    return base
  }
  
  @discardableResult
  func clipsToBounds(_ clipsToBounds: Bool) -> T {
    base.clipsToBounds = clipsToBounds
    return base
  }
  
  @discardableResult
  func mask(_ mask: UIView?) -> T {
    base.mask = mask
    return base
  }
  
  @discardableResult
  func transform(_ transform: CGAffineTransform) -> T {
    base.transform = transform
    return base
  }
  
  @available(iOS 13.0, *)
  @discardableResult
  func transform3D(_ transform3D: CATransform3D) -> T {
    base.transform3D = transform3D
    return base
  }
}

// MARK: - Event-Related Behavior

public extension KZWrapper where T: View {
  @discardableResult
  func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> T {
    base.isUserInteractionEnabled = isUserInteractionEnabled
    return base
  }
  
  @discardableResult
  func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool) -> T {
    base.isMultipleTouchEnabled = isMultipleTouchEnabled
    return base
  }
  
  @discardableResult
  func isExclusiveTouch(_ isExclusiveTouch: Bool) -> T {
    base.isExclusiveTouch = isExclusiveTouch
    return base
  }
}

// MARK: - Auto Layout

public extension KZWrapper where T: View {
  
  @discardableResult
  func setCompressionPriority(_ priority: UILayoutPriority,
                                               for axis: NSLayoutConstraint.Axis) -> T {
    base.setContentCompressionResistancePriority(priority, for: axis)
    return base
  }
  
  @discardableResult
  func setHuggingPriority(_ priority: UILayoutPriority,
                                 for axis: NSLayoutConstraint.Axis) -> T {
    base.setContentHuggingPriority(priority, for: axis)
    return base
  }
}


// MARK: - Resizing Behavior

public extension KZWrapper where T: View {
  
  @discardableResult
  func sizeToFit() -> T {
    base.sizeToFit()
    return base
  }
}

// MARK: - Gesture Recognizers
  
public extension KZWrapper where T: View {
  
  @discardableResult
  func gesture(_ gestureRecognizer: UIGestureRecognizer) -> T {
    base.addGestureRecognizer(gestureRecognizer)
    return base
  }
  
  @discardableResult
  func removeGesture(_ gestureRecognizer: UIGestureRecognizer) -> T {
    base.removeGestureRecognizer(gestureRecognizer)
    return base
  }
}

// MARK: - Identifying

public extension KZWrapper where T: View {
  
  func tag(_ tag: Int) -> T {
    base.tag = tag
    return base
  }
}

// TODO
// MARK: - Animation

// MARK: - Addition

public extension KZWrapper where T: View {
  
  @discardableResult
  func addToView(_ view: View) -> T {
    view.addSubview(base)
    return base
  }
  
  @discardableResult
  func addToFlexView(_ flexView: KZFlexView) -> T {
    flexView.addArrangedSubview(base)
    return base
  }
  
  @discardableResult
  func makeConstraints(_ closure: (_ make: ConstraintMaker) -> Void) -> T {
    base.snp.makeConstraints(closure)
    return base
  }
  
  @discardableResult
  func remakeConstraints(_ closure: (_ make: ConstraintMaker) -> Void) -> T {
    base.snp.remakeConstraints(closure)
    return base
  }
  
  @discardableResult
  func updateConstraints(_ closure: (_ make: ConstraintMaker) -> Void) -> T {
    base.snp.updateConstraints(closure)
    return base
  }
}
