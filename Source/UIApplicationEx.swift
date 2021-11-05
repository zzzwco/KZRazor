//
//  UIApplicationEx.swift
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

public extension UIApplication {
  
  static var appVersion: String? {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
  }
  
  static var appBuildVersion: String? {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
  }
  
  static var displayName: String? {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
  }
  
  static var lastWindow: UIWindow {
    if #available(iOS 15.0, *) {
      let scenes = UIApplication.shared.connectedScenes
      let windowScene = scenes.first as? UIWindowScene
      return windowScene!.windows.first!
    }
    return UIApplication.shared.windows.filter { $0.isKeyWindow }.first!
  }
  
  static var rootViewController: UIViewController? { lastWindow.rootViewController }
  
  static var navigationController: UINavigationController? {
    if rootViewController is UINavigationController { return (rootViewController as? UINavigationController) }
    return rootViewController?.navigationController
  }
  
  static func dismissKeyboard() {
    UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
  }
  
  static func call(tel: String) {
    if let url = URL(string: "tel://\(tel)") {
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
  }
}

