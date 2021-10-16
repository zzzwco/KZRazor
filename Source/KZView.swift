//
//  KZView.swift
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

public typealias KZView = UIView

// MARK: - Visual Appearance

public extension KZWrapper where T: KZView {
  
  enum GradientOrientation {
    case topRightBottomLeft
    case topLeftBottomRight
    case horizontal
    case vertical
  }
  
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
  
  @discardableResult
  func cornerRadius(_ radius: CGFloat) -> T {
    base.layer.masksToBounds = true
    base.layer.cornerRadius = radius
    return base
  }
  
  /// Call it in `layoutSubViews`
  @discardableResult
  func shadow(radius: CGFloat, opacity: Float, color: UIColor, offset: CGSize) -> T {
    base.layer.shadowColor = color.cgColor
    base.layer.shadowOffset = offset
    base.layer.shadowRadius = radius
    base.layer.shadowOpacity = opacity
    base.layer.masksToBounds = false
    base.layer.shadowPath = UIBezierPath(rect: base.bounds).cgPath
    return base
  }
  
  @discardableResult
  func border(width: CGFloat, color: UIColor?) -> T {
    base.layer.borderWidth = width
    base.layer.borderColor = color?.cgColor
    return base
  }
  
  /// Remember to set gradientLayer's frame in `layoutSubViews`
  @discardableResult
  func gradient(colors: [UIColor], orientation: GradientOrientation,
                layerHandler: ((CAGradientLayer) -> ())) -> T {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = colors.map { $0.cgColor }
    switch orientation {
    case .topLeftBottomRight:
      gradientLayer.startPoint = .init(x: 0, y: 0)
      gradientLayer.endPoint = .init(x: 1, y: 1)
    case .topRightBottomLeft:
      gradientLayer.startPoint = .init(x: 0, y: 1)
      gradientLayer.endPoint = .init(x: 1, y: 0)
    case .horizontal:
      gradientLayer.startPoint = .init(x: 0, y: 0.5)
      gradientLayer.endPoint = .init(x: 1, y: 0.5)
    case .vertical:
      gradientLayer.startPoint = .init(x: 0, y: 0)
      gradientLayer.endPoint = .init(x: 0, y: 1)
    }
    layerHandler(gradientLayer)
    base.layer.insertSublayer(gradientLayer, at: 0)
    return base
  }
}

// MARK: - Hierarchy

public extension KZWrapper where T: KZView {
  
  @discardableResult
  func addSubview(_ view: UIView) -> T {
    base.addSubview(view)
    return base
  }
  
  @discardableResult
  func addSubview(_ view: UIView, constraints: (_ make: ConstraintMaker) -> Void) -> T {
    base.addSubview(view)
    view.snp.makeConstraints(constraints)
    return base
  }
  
  @discardableResult
  func bringSubviewToFront(_ view: UIView) -> T {
    base.bringSubviewToFront(view)
    return base
  }
  
  @discardableResult
  func sendSubviewToBack(_ view: UIView) -> T {
    base.sendSubviewToBack(view)
    return base
  }
  
  @discardableResult
  func removeFromSuperview() -> T {
    base.removeFromSuperview()
    return base
  }
  
  @discardableResult
  func insertSubview(_ view: UIView, at index: Int) -> T {
    base.insertSubview(view, at: index)
    return base
  }
  
  @discardableResult
  func insertSubview(_ view: UIView, aboveSubview siblingSubview: UIView) -> T {
    base.insertSubview(view, aboveSubview: siblingSubview)
    return base
  }
  
  @discardableResult
  func insertSubview(_ view: UIView, belowSubview siblingSubview: UIView) -> T {
    base.insertSubview(view, belowSubview: siblingSubview)
    return base
  }
  
  @discardableResult
  func exchangeSubview(at index1: Int, withSubviewAt index2: Int) -> T {
    base.exchangeSubview(at: index1, withSubviewAt: index2)
    return base
  }
  
}

// MARK: - Event-Related Behavior

public extension KZWrapper where T: KZView {
  
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

// MARK: - Layout

public extension KZWrapper where T: KZView {
  
  @discardableResult
  func setNeedsLayout() -> T {
    base.setNeedsLayout()
    return base
  }
  
  @discardableResult
  func layoutIfNeeded() -> T {
    base.layoutIfNeeded()
    return base
  }
  
  @discardableResult
  func useAutoLayout() -> T {
    base.translatesAutoresizingMaskIntoConstraints = false
    return base
  }
  
}

// MARK: - Auto Layout

public extension KZWrapper where T: KZView {
  
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

public extension KZWrapper where T: KZView {
  
  @discardableResult
  func sizeToFit() -> T {
    base.sizeToFit()
    return base
  }
}

// MARK: - Gesture Recognizers
  
public extension KZWrapper where T: KZView {
  
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

public extension KZWrapper where T: KZView {
  
  func tag(_ tag: Int) -> T {
    base.tag = tag
    return base
  }
}

// TODO
// MARK: - Animation

// MARK: - Addition

public extension KZWrapper where T: KZView {
  
  @discardableResult
  func addToView(_ view: KZView) -> T {
    view.addSubview(base)
    return base
  }
  
  @discardableResult
  func addToFlexView(_ flexView: KZFlexView) -> T {
    flexView.addArrangedSubview(base)
    return base
  }
  
  @discardableResult
  func addToStackView(_ stackView: UIStackView) -> T {
    stackView.addArrangedSubview(base)
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

// MARK: - UIView Extension

public extension UIView {
  
  var fitSize: CGSize {
    self.sizeToFit()
    return self.bounds.size
  }
  
  func stacked(top: CGFloat, bottom: CGFloat, left: CGFloat, right: CGFloat) -> UIStackView {
    let stack = UIStackView()
    stack.isLayoutMarginsRelativeArrangement = true
    stack.layoutMargins = .init(top: top, left: left, bottom: bottom, right: right)
    stack.addArrangedSubview(self)
    return stack
  }
}
