//
//  SampleSegmentContainer.swift
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

class SampleSegmentContainer: UIViewController {
  
  let tv = KZSegmentContainer(types: [UIView.self])
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}


struct Model1 {
  var name1: String?
}

struct Model2 {
  var name2: String?
}

class View1: UIView, KZSegmentContainerView {
  
  var model: Model1 = .init()
  
  func refreshUI(model: Model1) {
    titleL.kz.text(model.name1)
  }
  
  var titleL = KZLabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    titleL.kz.addToView(self) { make in
      make.edges.equalToSuperview()
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


class View2: UIView, KZSegmentContainerView {
  
  var model: Model2 = .init()
  
  func refreshUI(model: Model2) {
    titleL.kz.text(model.name2).kz.textColor(.random)
  }
  
  var titleL = KZLabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    titleL.kz.addToView(self) { make in
      make.edges.equalToSuperview()
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
