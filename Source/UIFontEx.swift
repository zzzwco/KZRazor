//
//  UIFontEx.swift
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

public extension KZWrapper where T == UIFont {
  
  enum Style {
    case regular
    case italic
    case monoDigit(weight: UIFont.Weight)
  }
  
  @discardableResult
  static func size(_ size: CGFloat) -> T {
    UIFont.systemFont(ofSize: size)
  }
  
  @discardableResult
  func style(_ style: Style) -> T {
    switch style {
    case .regular:
      return UIFont.systemFont(ofSize: base.pointSize)
    case .italic:
      return UIFont.italicSystemFont(ofSize: base.pointSize)
    case let .monoDigit(weight):
      return UIFont.monospacedDigitSystemFont(ofSize: base.pointSize, weight: weight)
    }
  }
  
  @discardableResult
  func weight(_ weight: UIFont.Weight) -> T {
    UIFont.systemFont(ofSize: base.pointSize, weight: weight)
  }
}