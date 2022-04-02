//
//  KZUserDefaults.swift
//  KZRazor
//
//  Created by zzzwco on 2021/9/27.
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

struct KZUserDefaultsValueKey: RawRepresentable {
  var rawValue: String
}

struct KZUserDefaultsObjectKey: RawRepresentable {
  var rawValue: String
}

///
/// ```
/// // Example
///
/// // KZUserDefaultsValueKey
///
/// extension KZUserDefaultsValueKey {
///
///   static let token  = KZUserDefaultsValueKey(rawValue: "token")
/// }
///
/// KZUserDefaults.setValue("token xxx", for: .token)
/// KZUserDefaults.value(for: .token)
/// KZUserDefaults.removeValue(for: .token)
///
/// // KZUserDefaultsObjectKey
///
/// struct UserInfo: Reflectable {
///
///   var name: String?
///   var age: Int?
/// }
///
/// extension KZUserDefaultsObjectKey {
///
///   static let userInfo = KZUserDefaultsObjectKey(rawValue: "userInfo")
/// }
/// KZUserDefaults.setObject(UserInfo(name: "zzzwco", age: nil), for: .userInfo)
/// KZUserDefaults.objectValue(for: .userInfo, type: UserInfo.self)
/// KZUserDefaults.removeObjectValue(for: .userInfo)
/// ```
///
public struct KZUserDefaults {

  // MARK: - Value
  
  static func setValue(_ value: Any?, for key: KZUserDefaultsValueKey) {
    UserDefaults.standard.set(value, forKey: key.rawValue)
  }

  static func value(for key: KZUserDefaultsValueKey) -> Any? {
    return UserDefaults.standard.value(forKey: key.rawValue)
  }

  static func removeValue(for key: KZUserDefaultsValueKey) {
    UserDefaults.standard.set(nil, forKey: key.rawValue)
  }

  // MARK: - Object

  static func setObject<T: Reflectable>(_ object: T?, for key: KZUserDefaultsObjectKey) {
    let data = try? JSONEncoder().encode(object)
    UserDefaults.standard.set(data, forKey: key.rawValue)
  }

  static func objectValue<T: Reflectable>(for key: KZUserDefaultsObjectKey, type: T.Type) -> T? {
    guard let data = UserDefaults.standard.value(forKey: key.rawValue) as? Data else { return nil }
    return try? JSONDecoder().decode(type.self, from: data)
  }

  static func removeObjectValue(for key: KZUserDefaultsObjectKey) {
    UserDefaults.standard.removeObject(forKey: key.rawValue)
  }
}
