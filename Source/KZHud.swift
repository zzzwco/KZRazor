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
  
  @discardableResult
  public static func show<T: UIView>(
    view: T, height: CGFloat,
    interactive: Bool = true,
    presentationStyle: SwiftMessages.PresentationStyle = .center,
    backgroundColor: UIColor = .init(red: 0, green: 0, blue: 0, alpha: 0.3)
  ) -> T {
    let mv = MessageView()
    mv.backgroundHeight = height
    mv.installContentView(view)
    SMConfig.shared.config.presentationStyle = presentationStyle
    SMConfig.shared.config.dimMode = .color(color: backgroundColor, interactive: interactive)
    SwiftMessages.show(config: SMConfig.shared.config, view: mv)

    return view
  }

  public static func hide() {
    SwiftMessages.hide(animated: true)
    SwiftMessages.hideAll()
  }
}

class SMConfig {
  static let shared = SMConfig()

  var config = SwiftMessages.Config()

  init() {
    config.interactiveHide = false
    config.presentationStyle = .bottom
    config.presentationContext = .window(windowLevel: .normal)
    config.duration = .forever
    config.keyboardTrackingView = KeyboardTrackingView()
  }
}



