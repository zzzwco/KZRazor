//
//  ProductView.swift
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

class ProductView: UIView {
  
  private var style: ProductViewStyle
  
  init<T: ProductViewStyle>(_ style: T) {
    self.style = style
    super.init(frame: .zero)
    style.configUI()
    
    self.kz.backgroundColor(.white)
    
    if style is ProductViewiPhoneStyle {
      style.base.nameL.kz.textAlignment(.center).kz.setHuggingPriority(.required, for: .vertical)
        .kz.addToView(self) { m in
          m.centerX.equalToSuperview()
          m.bottom.equalToSuperview().offset(-style.base.marginY)
        }
      
      style.base.iconImgV.kz.addToView(self) { m in
        m.left.top.equalToSuperview().offset(style.base.marginX)
        m.right.equalToSuperview().offset(-style.base.marginX)
        m.bottom.equalTo(style.base.nameL.snp.top).offset(-style.base.marginY)
      }
    }
    
    if style is ProductViewMacStyle {
      style.base.nameL.kz.addToView(self) { m in
        m.left.top.equalToSuperview().offset(style.base.marginX)
        m.right.equalToSuperview().offset(-style.base.marginX)
      }
      
      style.base.introL.kz.addToView(self) { m in
        m.left.equalToSuperview().offset(style.base.marginX)
        m.right.equalToSuperview().offset(-style.base.marginX)
        m.top.equalTo(style.base.nameL.snp.bottom).offset(style.base.marginY)
      }
      
      style.base.iconImgV.kz.addToView(self) { m in
        m.top.equalTo(style.base.introL.snp.bottom).offset(style.base.marginY)
        m.left.equalToSuperview().offset(style.base.marginX)
        m.right.bottom.equalToSuperview().offset(-style.base.marginX)
        m.height.equalTo(style.base.iconImgV.snp.width)
      }
    }
  }

  @discardableResult
  func refreshUI(with product: Product) -> Self {
    style.refreshUI(with: product)
    return self
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.kz.cornerRadius(15)
      .kz.shadow(radius: 10, opacity: 0.1, color: .black, offset: .zero)
  }
}

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

struct ProductViewBase {
  
  var iconImgV = UIImageView()
  var nameL = UILabel()
  var introL = UILabel()
  
  var marginX: CGFloat
  var marginY: CGFloat
}

// MARK: - ProductViewStyle

protocol ProductViewStyle {
  
  var base: ProductViewBase { get set }
  func configUI()
  func refreshUI(with product: Product)
}

extension ProductViewStyle {
  
  func configUI() {
    base.nameL.kz.font(.kz.size(22))
    base.iconImgV.kz.contentMode(.scaleAspectFit).kz.tintColor(.random)
    base.introL.kz.numberOfLines(0).kz.textColor(.gray)
  }
  
  func refreshUI(with product: Product) {
    base.nameL.kz.text(product.name)
    base.introL.kz.text(product.intro)
    if #available(iOS 13.0, *) {
      base.iconImgV.kz.image(.kz.systemName(product.icon))
    }
  }
}

// MARK: - ProductViewMacStyle

class ProductViewMacStyle: ProductViewStyle {
  
  var base: ProductViewBase = .init(introL: UILabel(), marginX: 40, marginY: 20)
}

extension ProductViewStyle where Self == ProductViewMacStyle {
  
  static var mac: Self { Self() }
}

// MARK: - ProductViewiPhoneStyle

class ProductViewiPhoneStyle: ProductViewStyle {
  
  var base: ProductViewBase = .init(marginX: 10, marginY: 10)
}

extension ProductViewStyle where Self == ProductViewiPhoneStyle {
  
  static var iPhone: Self { Self() }
}
