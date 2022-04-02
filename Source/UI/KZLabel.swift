//
//  KZLabel.swift
//  KZRazor
//
//  Created by zzzwco on 2021/9/20.
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

public typealias KZLabel = QMUILabel

// MARK: - KZLabel

public extension KZWrapper where T: KZLabel {
  
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

// MARK: - UILabel extension

public extension KZWrapper where T: UILabel {
  
  @discardableResult
  func text(_ text: String?) -> T {
    base.text = text
    return base
  }
  
  @discardableResult
  func font(_ font: UIFont) -> T {
    base.font = font
    return base
  }
  
  @discardableResult
  func textColor(_ textColor: UIColor) -> T {
    base.textColor = textColor
    return base
  }
  
  @discardableResult
  func textAlignment(_ textAlignment: NSTextAlignment) -> T {
    base.textAlignment = textAlignment
    return base
  }
  
  @discardableResult
  func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> T {
    base.lineBreakMode = lineBreakMode
    return base
  }
  
  @discardableResult
  func numberOfLines(_ numberOfLines: Int) -> T {
    base.numberOfLines = numberOfLines
    return base
  }
  
  @discardableResult
  func highlightedTextColor(_ highlightedTextColor: UIColor?) -> T {
    base.highlightedTextColor = highlightedTextColor
    return base
  }
  
  @discardableResult
  func shadowColor(_ shadowColor: UIColor?) -> T {
    base.shadowColor = shadowColor
    return base
  }
  
  @discardableResult
  func shadowOffset(_ shadowOffset: CGSize) -> T {
    base.shadowOffset = shadowOffset
    return base
  }
}
