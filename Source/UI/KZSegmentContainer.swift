//
//  KZSegmentContainer.swift
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

open class KZSegmentContainer: UIView {
  
  public func select(at index: Int) {
    self.selectedIndex = index
    showElementView()
  }
  
  public private(set) var selectedIndex: Int = 0
  
  public init(types: [UIView.Type], selectedIndex: Int = 0) {
    self.selectedIndex = selectedIndex
    self.types = types
    self.elemetnViews = Array(repeating: nil, count: types.count)
    super.init(frame: .zero)
    container.kz.addToView(self) { make in
      make.edges.equalToSuperview()
    }
  }
  
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private let container = KZFlexView(axis: .horizontal)
  private var types: [UIView.Type]
  private var elemetnViews: [UIView?]
  
  private func showElementView() {
    
  }
}

open class KZSegmentContent: UIView {
  
}

public protocol KZSegmentContainerView {
  
  associatedtype Model
  
  var model: Self.Model { get }
  
  func refreshUI(model: Self.Model)
}
