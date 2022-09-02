//
//  SampleKZFlexView.swift
//  KZRazor
//
//  Created by zzzwco on 2022/9/2.
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

import UIKit

class SampleKZFlexView: UIViewController {
  
  private let container = KZFlexView(axis: .vertical)
  private let title1L = createTitle("iPhone、iPad")
  private let title2L = createTitle("Mac")
  private let iphonesView = KZFlexView(axis: .horizontal)
  private var isiPhonesViewHidden = false
  
  private static let createTitle: (String) -> UILabel = { title -> UILabel in
    UILabel().kz.text(title)
      .kz.font(UIFont.kz.size(20).kz.weight(.bold))
  }
  
  // MARK: - Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Apple Store"
    view.backgroundColor = .white
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
    
    container.kz.addToView(view, constraints: { make in
      make.edges.equalToSuperview()
    })
    .margins(.init(top: 20, left: 20, bottom: 20, right: 20)).spacing(20)
    .addArrangedSubview(title1L)
    .addArrangedSubview(iphonesView, constraints: { make in
      make.height.equalTo(view.snp.width).dividedBy(2.5)
    })
    .addArrangedSubview(title2L)
    .addArrangedSubviews(Product.macs.map { ProductView(.mac).refreshUI(with: $0) })
    
    iphonesView.spacing(15).kz.with { v in
      v.showsHorizontalScrollIndicator = false
      v.layer.masksToBounds = false
      
      for p in Product.iPhones {
        let iPhoneView = ProductView(.iPhone).refreshUI(with: p)
        v.addArrangedSubview(iPhoneView)
        iPhoneView.kz.makeConstraints { make in
          make.width.equalTo(iPhoneView.snp.height)
        }
      }
    }
  }
}

// MARK: - Events

private extension SampleKZFlexView {
  
  @objc func refresh() {
    self.isiPhonesViewHidden = !self.isiPhonesViewHidden
    UIView.animate(withDuration: 0.25) {
      self.title1L.isHidden = self.isiPhonesViewHidden
      self.iphonesView.isHidden = self.isiPhonesViewHidden
    }
  }
}
