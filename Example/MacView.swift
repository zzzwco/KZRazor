//
//  MacView.swift
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

class MacView: UIView {
  
  private let marginX: CGFloat = 40
  private let marginY: CGFloat = 20
  var configuration: ProductViewConfiguration?
  
  init(configuration: ProductViewConfiguration) {
    super.init(frame: .zero)
    self.configuration = configuration
    setupUI(with: configuration)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    showShadow()
  }
  
  func setupUI(with cfg: ProductViewConfiguration) {
    self.kz.backgroundColor(.white)
    
    cfg.nameL.kz.addToView(self)
      .kz.makeConstraints { m in
        m.left.top.equalToSuperview().offset(marginX)
        m.right.equalToSuperview().offset(-marginX)
      }
    
    cfg.introL.kz.addToView(self)
      .kz.makeConstraints { m in
        m.left.equalToSuperview().offset(marginX)
        m.right.equalToSuperview().offset(-marginX)
        m.top.equalTo(cfg.nameL.snp.bottom).offset(marginY)
      }
    
    cfg.iconImgV.kz.addToView(self)
      .kz.makeConstraints { m in
        m.top.equalTo(cfg.introL.snp.bottom).offset(marginY)
        m.left.equalToSuperview().offset(marginX)
        m.right.bottom.equalToSuperview().offset(-marginX)
        m.height.equalTo(cfg.iconImgV.snp.width)
      }
  }
}
