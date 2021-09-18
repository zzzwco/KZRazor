//
//  KZFlexView.swift
//  KZFlexView
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

import UIKit
import SnapKit

open class KZFlexView: UIScrollView {
  
  public var stackView = UIStackView()
  public var spacing: CGFloat {
    get { stackView.spacing }
    set { stackView.spacing = newValue }
  }
  public var margins: UIEdgeInsets {
    get { stackView.layoutMargins }
    set {
      stackView.isLayoutMarginsRelativeArrangement = true
      stackView.layoutMargins = newValue
    }
  }
  public func addArrangedSubview(_ view: UIView) {
    stackView.addArrangedSubview(view)
  }
  public func addArrangedSubviews(_ views: [UIView]) {
    views.forEach { stackView.addArrangedSubview($0) }
  }
  public func setCustomSpacing(_ spacing: CGFloat, after: UIView) {
    stackView.setCustomSpacing(spacing, after: after)
  }
  
  /// Create an instance
  /// - Parameter axis: Scroll direction
  public convenience init(axis: NSLayoutConstraint.Axis) {
    self.init()
    stackView.axis = axis
    if axis == .vertical {
      stackView.snp.makeConstraints { make in
        make.width.equalToSuperview()
      }
    } else {
      stackView.snp.makeConstraints { make in
        make.height.equalToSuperview()
      }
    }
  }
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
  }
  
  func setupUI() {
    addSubview(stackView)
    stackView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
}
