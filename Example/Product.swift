//
//  Product.swift
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

struct Product {
  let icon: String
  let name: String
  let intro: String?
  
  static var iPhones: [Product] {
    [
      .init(icon: "iphone", name: "iPhone 12", intro: nil),
      .init(icon: "iphone.homebutton", name: "iPhone 8", intro: nil),
      .init(icon: "ipad.homebutton", name: "iPad", intro: nil),
      .init(icon: "ipad.homebutton", name: "iPad Pro", intro: nil)
    ]
  }
  
  static var macs: [Product] {
    [
      .init(icon: "desktopcomputer", name: "iMac", intro: "经典传承"),
      .init(icon: "macmini", name: "Mac mini", intro: "身型小巧\n性能强大"),
      .init(icon: "macpro.gen3", name: "Mac Pro",
            intro: "极致澎湃\n快人一步\n吧啦吧啦\n吧啦吧啦\n吧啦吧啦\n吧啦吧啦")
    ]
  }
}
