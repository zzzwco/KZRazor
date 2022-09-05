//
//  ViewController.swift
//  KZRazor
//
//  Created by Bruce on 2021/9/18.
//

import UIKit

class ViewController: UIViewController {
  
  private let data: [(String, UIViewController.Type)] = [
    ("KZFlexView", SampleKZFlexView.self),
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.title = "Examples"
    
    KZFlexView(axis: .vertical).kz.addToView(self.view) { make in
      make.edges.equalToSuperview()
    }
    .addArrangedSubviews(
      data.enumerated().map { i, v in
        KZButton().kz.title(v.0).kz.padding(16).kz.tag(i)
          .kz.addTarget(self, action: #selector(clickButton(_:)), for: .touchUpInside)
      }
    )
  }
  
  @objc func clickButton(_ button: KZButton) {
    let model = data[button.tag]
    let vc = model.1.init()
    vc.title = model.0
    self.navigationController?.pushViewController(vc, animated: true)
  }
}
