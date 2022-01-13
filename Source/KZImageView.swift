//
//  KZImageView.swift
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

public typealias KZImageView = UIImageView

public extension KZWrapper where T == KZImageView {
  
  @discardableResult
  static func named(_ name: String) -> T {
    return UIImageView(image: UIImage.kz.named(name))
  }
  
  @discardableResult
  static func uncachedNamed(_ name: String) -> T{
    return UIImageView(image: UIImage.kz.uncached(name))
  }
  
  @available(iOS 13.0, *)
  @discardableResult
  static func systemName(_ name: String) -> T {
    return UIImageView(image: UIImage.kz.systemName(name))
  }
  
  @discardableResult
  func image(_ image: UIImage?) -> T {
    base.image = image
    return base
  }
  
  @discardableResult
  func named(_ name: String) -> T {
    base.image = .init(named: name)
    return base
  }
  
  @discardableResult
  func uncachedNamed(_ name: String) -> T {
    base.image = UIImage.kz.uncached(name)
    return base
  }
  
  @available(iOS 13.0, *)
  @discardableResult
  func systemName(_ name: String) -> T {
    base.image = UIImage.kz.systemName(name)
    return base
  }
  
  @discardableResult
  func contentMode(_ contentMode: UIView.ContentMode) -> T {
    base.contentMode = contentMode
    return base
  }
}
