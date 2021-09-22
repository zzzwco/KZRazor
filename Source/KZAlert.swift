//
//  KZAlert.swift
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
import UIKit

class KZAlert: NSObject {
  struct Action {
    var title: String
    var style: UIAlertAction.Style
  }
  
  static func show(
    title: String, message: String? = nil,
    actions: [Action],
    preferredStyle: UIAlertController.Style = .alert,
    defaultHandler: @escaping (Action) -> Void,
    tintColor: UIColor? = nil, cancelTitleColor: UIColor? = nil,
    cancelHandler: (() -> Void)? = nil
  ) {
    let alertVc = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
    if let tintColor = tintColor {
      alertVc.view.tintColor = tintColor
    }
    for v in actions {
      let ac = UIAlertAction(title: v.title, style: v.style) { _ in
        if v.style == .cancel {
          cancelHandler?()
        } else {
          defaultHandler(v)
        }
      }
      if v.style == .cancel {
        if let cancelTitleColor = cancelTitleColor {
          ac.setValue(cancelTitleColor, forKey: "titleTextColor")
        }
      }
      alertVc.addAction(ac)
    }
    UIApplication.rootViewController?.present(alertVc, animated: true, completion: nil)
  }
}
