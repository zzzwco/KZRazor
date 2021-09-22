//
//  KZButton.swift
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
import QMUIKit

public typealias KZButton = QMUIButton

// MARK: - KZButton

public extension KZWrapper where T: KZButton {
  
  @discardableResult
  func padding(_ length: CGFloat) -> T {
    base.contentEdgeInsets = .init(top: length, left: length, bottom: length, right: length)
    return base
  }
  
  @discardableResult
  func padding(top: CGFloat, bottom: CGFloat, left: CGFloat, right: CGFloat) -> T {
    base.contentEdgeInsets = .init(top: top, left: left, bottom: bottom, right: right)
    return base
  }
  
  @discardableResult
  func imagePositon(_ position: QMUIButtonImagePosition) -> T {
    base.imagePosition = position
    return base
  }
  
  @discardableResult
  func spacingBetweenImageAndTitle(_ spacing: CGFloat) -> T {
    base.spacingBetweenImageAndTitle = spacing
    return base
  }
  
  @discardableResult
  func capsuled() -> T {
    base.cornerRadius = QMUIButtonCornerRadiusAdjustsBounds
    return base
  }
}

// MARK: - UIButton extension

public extension KZWrapper where T: UIButton {
  
  @discardableResult
  func title(_ title: String, for state: UIControl.State = .normal) -> T {
    base.setTitle(title, for: state)
    return base
  }
  
  @discardableResult
  func titleColor(_ titleColor: UIColor?, for state: UIControl.State = .normal) -> T {
    base.setTitleColor(titleColor, for: state)
    return base
  }
  
  @discardableResult
  func padding(_ length: CGFloat) -> T {
    base.contentEdgeInsets = .init(top: length, left: length, bottom: length, right: length)
    return base
  }
  
  @discardableResult
  func padding(top: CGFloat, bottom: CGFloat, left: CGFloat, right: CGFloat) -> T {
    base.contentEdgeInsets = .init(top: top, left: left, bottom: bottom, right: right)
    return base
  }
}
