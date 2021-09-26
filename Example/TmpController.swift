//
//  TmpController.swift
//  KZRazor
//
//  Created by zzzwco on 2021/9/23.
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

class TmpController: UIViewController {
  
  override func viewDidLoad() {
    view.backgroundColor = .white
    
    KZButton().kz.title("HELLO")
      .kz.addTarget(self, action: #selector(action), for: .touchUpInside)
      .kz.addToView(view)
      .kz.makeConstraints { m in
        m.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        m.centerX.equalToSuperview()
      }
  }
  
  @objc func action() {
    
  }
  
  deinit {
    KZPrint.log(message: self)
  }
}


class TestView: UIView {
  
  let label = KZLabel()
  let imgV = KZImageView()
  
  init() {
    super.init(frame: .zero)
    
    label.kz.text("Hello")
      .kz.textColor(.random)
      .kz.addToView(self)
    
    imgV.kz.backgroundColor(.random)
      .kz.addToView(self)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    label.frame = .init(x: 0, y: 0, width: bounds.size.width, height: 30)
    imgV.frame = .init(x: 0, y: label.bounds.size.height, width: bounds.size.width, height: bounds.height - label.bounds.size.height)
  }
}
