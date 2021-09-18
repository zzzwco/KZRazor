//
//  ViewController.swift
//  KZRazor
//
//  Created by Bruce on 2021/9/18.
//

import UIKit

class ViewController: UIViewController {
  
  private let flexViewY = KZFlexView(axis: .vertical)
  private let title1L = titleLClousure("iPhone、iPad")
  private let title2L = titleLClousure("Mac")
  private let iphonesView = KZFlexView(axis: .horizontal)
  
  private static let titleLClousure: (String) -> UILabel = { title -> UILabel in
    UILabel().kz.with { v in
      v.font = .kz.size(20).kz.weight(.bold)
      v.text = title
    }
  }
  
  // MARK: - Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Apple Store"
    view.backgroundColor = .white
    
    flexViewY.kz.with { v in
      v.margins = .init(top: 20, left: 20, bottom: 20, right: 20)
      v.spacing = 20
    }
    .kz.addToView(view)
    .kz.makeConstraints { m in
      m.edges.equalToSuperview()
    }
    
    title1L.kz.addToFlexView(flexViewY)
    
    iphonesView.kz.with { v in
      v.showsHorizontalScrollIndicator = false
      v.layer.masksToBounds = false
      v.spacing = 15
      
      for p in Product.iPhones {
        let cfg = DefaultProductViewConfiguration().configUI(with: p)
        let v1 = iPhoneView(configuration: cfg)
        v.addArrangedSubview(v1)
        v1.kz.makeConstraints { m in
          m.width.equalTo(v1.snp.height)
        }
      }
    }
    .kz.addToFlexView(flexViewY)
    .kz.makeConstraints { m in
      m.height.equalTo(view.snp.width).dividedBy(2.5)
    }
    
    title2L.kz.addToFlexView(flexViewY)
    
    for p in Product.macs {
      let cfg = DefaultProductViewConfiguration().configUI(with: p)
      let v = MacView(configuration: cfg)
      v.kz.addToFlexView(flexViewY)
    }
  }
  
  
}
