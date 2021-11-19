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

public typealias KZApp = UIApplication

public extension KZApp {
  
  static var displayName: String? {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
  }
  
  @available(*, deprecated, renamed: "version")
  static var appVersion: String? {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
  }
  static var version: String? {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
  }
  
  @available(*, deprecated, renamed: "buildVersion")
  static var appBuildVersion: String? {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
  }
  static var buildVersion: String? {
    return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
  }
  
  @available(*, deprecated, renamed: "topWindow")
  static var lastWindow: UIWindow {
    if #available(iOS 15.0, *) {
      let scenes = UIApplication.shared.connectedScenes
      let windowScene = scenes.first as? UIWindowScene
      return windowScene!.windows.first!
    }
    return UIApplication.shared.windows.filter { $0.isKeyWindow }.first!
  }
  static var topWindow: UIWindow {
    if #available(iOS 15.0, *) {
      let scenes = UIApplication.shared.connectedScenes
      let windowScene = scenes.first as? UIWindowScene
      return windowScene!.windows.first!
    }
    return UIApplication.shared.windows.filter { $0.isKeyWindow }.first!
  }
  
  @available(*, deprecated, renamed: "rootController")
  static var rootViewController: UIViewController? { topWindow.rootViewController }
  static var rootController: UIViewController? { topWindow.rootViewController }
  
  @available(*, deprecated, renamed: "topController")
  static var topViewController: UIViewController? { navigationController?.topViewController }
  // From: https://gist.github.com/CassiusPacheco/a3887e5da50ec2f5fe0e7e9d072a4937
  static func topController(for window: UIWindow? = topWindow) -> UIViewController? {
    guard let rootVC = window?.rootViewController else { return nil }
    var top: UIViewController? = rootVC
    while true {
      if let presented = top?.presentedViewController {
        top = presented
      } else if let nav = top as? UINavigationController {
        top = nav.visibleViewController
      } else if let tab = top as? UITabBarController {
        top = tab.selectedViewController
      } else {
        break
      }
    }
    return top
  }
  
  static var navigationController: UINavigationController? {
    if rootController is UINavigationController {
      return (rootController as? UINavigationController)
    }
    if rootController is UITabBarController {
      let vc = (rootController as? UITabBarController)?.selectedViewController
      if vc is UINavigationController {
        return (vc as? UINavigationController)
      }
      return vc?.navigationController
    }
    return rootController?.navigationController
  }
  
  static func dismissKeyboard() {
    UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
  }
  
  static func call(tel: String) {
    if let url = URL(string: "tel://\(tel)"), UIApplication.shared.canOpenURL(url) {
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
  }
}

