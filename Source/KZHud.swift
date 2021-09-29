//
//  KZHud.swift
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
import SwiftMessages
import UIKit

public class KZHud {
  
  ///  The default view config
  ///
  ///  Custom:
  ///  ```
  ///  var cfg = KZHud.config
  ///  cfg.presentationStyle = .center
  ///  // other config
  ///  ```
  ///
  public static var viewConfig: SwiftMessages.Config {
    var config = SwiftMessages.Config()
    config.presentationContext = .window(windowLevel: .normal)
    config.duration = .forever
    config.presentationStyle = .center
    config.keyboardTrackingView = KeyboardTrackingView()
    config.dimMode = .color(color: .init(red: 0, green: 0, blue: 0, alpha: 0.3), interactive: true)
    return config
  }
  
  /// Show View
  public static func show<T: UIView>(
    view: T, presentationStyle: SwiftMessages.PresentationStyle = .center,
    height: CGFloat? = nil, config: SwiftMessages.Config = viewConfig) {
      let mv = MessageView()
      mv.backgroundHeight = height
      mv.installContentView(view)
      var cfg = config
      cfg.presentationStyle = presentationStyle
      SwiftMessages.show(config: cfg, view: mv)
    }
  
  /// Show VC
  public static func show<T: UIViewController>(vc: T, source: T, height: CGFloat? = nil,
                                               layout: SwiftMessagesSegue.Layout = .centered) {
    let segue = SwiftMessagesSegue(identifier: nil, source: source, destination: vc)
    segue.messageView.backgroundHeight = height
    segue.configure(layout: layout)
    segue.perform()
  }
  
  /// Hide all hud
  public static func hideAll() {
    SwiftMessages.hide(animated: true)
    SwiftMessages.hideAll()
  }
}
