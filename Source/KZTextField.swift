//
//  KZTextField.swift
//  KZRazor
//
//  Created by zzzwco on 2021/9/22.
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

public typealias KZTextField = QMUITextField

// MARK: - KZTextField

public extension KZWrapper where T: KZTextField {
  
  @discardableResult
  func delegate(_ delegate: QMUITextFieldDelegate) -> T {
    base.delegate = delegate
    return base
  }
  
  @discardableResult
  func placeholder(_ placeholder: String, color: UIColor? = nil) -> T {
    base.placeholder = placeholder
    base.placeholderColor = color
    return base
  }
  
  @discardableResult
  func padding(_ length: CGFloat) -> T {
    base.textInsets = .init(top: length, left: length, bottom: length, right: length)
    return base
  }
  
  @discardableResult
  func padding(top: CGFloat, bottom: CGFloat, left: CGFloat, right: CGFloat) -> T {
    base.textInsets = .init(top: top, left: left, bottom: bottom, right: right)
    return base
  }
  
  @discardableResult
  func maximumTextLength(_ length: UInt) -> T {
    base.maximumTextLength = length
    return base
  }
  
  @discardableResult
  func shouldCountingNonASCIICharacterAsTwo(_ should: Bool) -> T {
    base.shouldCountingNonASCIICharacterAsTwo = should
    return base
  }
}

// MARK: - UITextField

public extension KZWrapper where T: UITextField {
  
  @discardableResult
  func font(_ font: UIFont) -> T {
    base.font = font
    return base
  }
  
  @discardableResult
  func textColor(_ color: UIColor?) -> T {
    base.textColor = color
    return base
  }
  
  @discardableResult
  func textAlignment(_ alignment: NSTextAlignment) -> T {
    base.textAlignment = alignment
    return base
  }
}
