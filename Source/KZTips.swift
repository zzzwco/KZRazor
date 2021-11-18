//
//  KZTips.swift
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

public class KZTips {
  
  @discardableResult
  public static func showLoading(
    in view: UIView, withText: String? = nil, isUserInteractionEnabled: Bool = false,
    detailText: String? = nil
  ) -> QMUITips {
    let tips = QMUITips.showLoading(withText, detailText: detailText, in: view)
    tips.isUserInteractionEnabled = !isUserInteractionEnabled
    return tips
  }
  
  @discardableResult
  public static func showText(
    _ withText: String?, in view: UIView, isUserInteractionEnabled: Bool = true,
    detailText: String? = nil, hideAfterDelay: TimeInterval = 1.5
  ) -> QMUITips {
    let tips = QMUITips.show(
      withText: withText, detailText: detailText, in: view, hideAfterDelay: hideAfterDelay)
    tips.isUserInteractionEnabled = !isUserInteractionEnabled
    return tips
  }

  @discardableResult
  public static func showInfo(
    _ text: String?, in view: UIView, isUserInteractionEnabled: Bool = true,
    detailText: String? = nil, hideAfterDelay: TimeInterval = 1.5
  ) -> QMUITips {
    let tips = QMUITips.showInfo(
      text, detailText: detailText, in: view, hideAfterDelay: hideAfterDelay)
    tips.isUserInteractionEnabled = !isUserInteractionEnabled
    return tips
  }

  @discardableResult
  public static func showSucceed(
    _ text: String?, in view: UIView, isUserInteractionEnabled: Bool = true,
    detailText: String? = nil, hideAfterDelay: TimeInterval = 1.5
  ) -> QMUITips {
    let tips = QMUITips.showSucceed(
      text, detailText: detailText, in: view, hideAfterDelay: hideAfterDelay)
    tips.isUserInteractionEnabled = !isUserInteractionEnabled
    return tips
  }

  @discardableResult
  public static func showError(
    _ text: String?, in view: UIView, isUserInteractionEnabled: Bool = true,
    detailText: String? = nil, hideAfterDelay: TimeInterval = 1.5
  ) -> QMUITips {
    let tips = QMUITips.showError(
      text, detailText: detailText, in: view, hideAfterDelay: hideAfterDelay)
    tips.isUserInteractionEnabled = !isUserInteractionEnabled
    return tips
  }

  public static func hideAllTips() {
    QMUITips.hideAllTips()
  }
}
