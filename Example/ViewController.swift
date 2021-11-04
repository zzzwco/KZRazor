//
//  ViewController.swift
//  KZRazor
//
//  Created by Bruce on 2021/9/18.
//

import UIKit
import SwiftMessages

class ViewController: UIViewController {
  
  private let container = KZFlexView(axis: .vertical)
  private let title1L = titleLClousure("iPhone、iPad")
  private let title2L = titleLClousure("Mac")
  private let iphonesView = KZFlexView(axis: .horizontal)
  private var isiPhonesViewHidden = false
  
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
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
    navigationItem.leftBarButtonItem = UIBarButtonItem(
      barButtonSystemItem: .play, target: self, action: #selector(tmp))
    
    container.margins(.init(top: 20, left: 20, bottom: 20, right: 20)).spacing(20)
      .kz.addToView(view, constraints: { make in
        make.edges.equalToSuperview()
      })
      .addArrangedSubview(title1L)
      .addArrangedSubview(iphonesView, constraints: { make in
        make.height.equalTo(view.snp.width).dividedBy(2.5)
      })
      .addArrangedSubview(title2L)
      .addArrangedSubviews(Product.macs.map { ProductView(.mac).refreshUI(with: $0) })
    
    iphonesView.spacing(15)
      .kz.with { v in
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

private extension ViewController {
  
  @objc func refresh() {
    self.isiPhonesViewHidden = !self.isiPhonesViewHidden
    UIView.animate(withDuration: 0.25) {
      self.title1L.isHidden = self.isiPhonesViewHidden
      self.iphonesView.isHidden = self.isiPhonesViewHidden
    }
  }
  
  @objc func tmp() {
    navigationController?.pushViewController(TmpController(), animated: true)
  }
}
