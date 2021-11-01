//
//  KZStackView.swift
//  KZRazor
//
//  Created by zzzwco on 2021/9/28.
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

public typealias KZStackView = UIStackView

public extension KZWrapper where T: KZStackView {
  
  @discardableResult
  func alignment(_ alignment: UIStackView.Alignment) -> T {
    base.alignment = alignment
    return base
  }
  
  @discardableResult
  func axis(_ axis: NSLayoutConstraint.Axis) -> T {
    base.axis = axis
    return base
  }
  
  @discardableResult
  func isBaselineRelativeArrangement(_ isBaselineRelativeArrangement: Bool) -> T {
    base.isBaselineRelativeArrangement = isBaselineRelativeArrangement
    return base
  }
  
  @discardableResult
  func distribution(_ distribution: UIStackView.Distribution) -> T {
    base.distribution = distribution
    return base
  }
  
  @discardableResult
  func isLayoutMarginsRelativeArrangement(_ isLayoutMarginsRelativeArrangement: Bool) -> T {
    base.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
    return base
  }
  
  @discardableResult
  func margins(_ length: CGFloat) -> T {
    base.isLayoutMarginsRelativeArrangement = true
    base.layoutMargins = .init(top: length, left: length, bottom: length, right: length)
    return base
  }
  
  @discardableResult
  func margins(_ insets: UIEdgeInsets) -> T {
    base.isLayoutMarginsRelativeArrangement = true
    base.layoutMargins = insets
    return base
  }
  
  @discardableResult
  func spacing(_ spacing: CGFloat) -> T {
    base.spacing = spacing
    return base
  }
  
  @discardableResult
  func setCustomSpacing(_ spacing: CGFloat, after view: UIView) -> T {
    base.setCustomSpacing(spacing, after: view)
    return base
  }
  
  @discardableResult
  func addArrangedSubview(_ view: UIView) -> T {
    base.addArrangedSubview(view)
    return base
  }
  
  @discardableResult
  func addArrangedSubview(_ view: UIView, customSpacing: CGFloat) -> T {
    base.addArrangedSubview(view)
    base.setCustomSpacing(customSpacing, after: view)
    return base
  }
  
  @discardableResult
  func addArrangedSubview(_ view: UIView, constraints: (_ make: ConstraintMaker) -> Void) -> T {
    base.addArrangedSubview(view)
    view.snp.makeConstraints(constraints)
    return base
  }

  @discardableResult
  func addArrangedSubview(_ view: UIView, customSpacing: CGFloat, constraints: (_ make: ConstraintMaker) -> Void) -> T {
    base.addArrangedSubview(view)
    base.setCustomSpacing(customSpacing, after: view)
    view.snp.makeConstraints(constraints)
    return base
  }
  
  @discardableResult
  func layoutMargins(_ layoutMargins: UIEdgeInsets) -> T {
    base.layoutMargins = layoutMargins
    return base
  }
  
  @discardableResult
  func addArrangedSubviews(_ views: [UIView]) -> T {
    views.forEach { base.addArrangedSubview($0) }
    return base
  }
  
  @discardableResult
  func insertArrangedSubview(_ view: UIView, at stackIndex: Int) -> T {
    base.insertArrangedSubview(view, at: stackIndex)
    return base
  }
  
  @discardableResult
  func removeArrangedSubview(_ view: UIView) -> T {
    base.removeArrangedSubview(view)
    return base
  }
  
  @discardableResult
  func removeAllArrangedSubviews() -> T {
    base.arrangedSubviews.forEach {
      base.removeArrangedSubview($0)
      NSLayoutConstraint.deactivate($0.constraints)
      $0.removeFromSuperview()
    }
    return base
  }
}
