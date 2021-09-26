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
  
  @discardableResult
  func margins(_ length: CGFloat) -> Self {
    self.margins = .init(top: length, left: length, bottom: length, right: length)
    return self
  }
  
  @discardableResult
  func margins(_ insets: UIEdgeInsets) -> Self {
    self.margins = insets
    return self
  }
  
  @discardableResult
  func spacing(_ spacing: CGFloat) -> Self {
    self.spacing = spacing
    return self
  }
  
  @discardableResult
  func alignment(_ alignment: UIStackView.Alignment) -> Self {
    self.alignment = alignment
    return self
  }
  
  @discardableResult
  func distribution(_ distribution: UIStackView.Distribution) -> Self {
    self.distribution = distribution
    return self
  }
  
  @discardableResult
  func addArrangedSubview(_ view: UIView) -> Self {
    self.stackView.addArrangedSubview(view)
    return self
  }
  
  @discardableResult
  func addArrangedSubviews(_ views: [UIView]) -> Self {
    views.forEach { stackView.addArrangedSubview($0) }
    return self
  }
  
  @discardableResult
  func customSpacing(_ spacing: CGFloat, after view: UIView) -> Self {
    self.stackView.setCustomSpacing(spacing, after: view)
    return self
  }
  
  public var stackView = UIStackView()
  
  public var spacing: CGFloat {
    get { stackView.spacing }
    set { stackView.spacing = newValue }
  }
  
  public var alignment: UIStackView.Alignment {
    get { stackView.alignment }
    set { stackView.alignment = newValue }
  }
  
  public var distribution: UIStackView.Distribution {
    get { stackView.distribution }
    set { stackView.distribution = newValue }
  }
  
  public var margins: UIEdgeInsets {
    get { stackView.layoutMargins }
    set {
      stackView.isLayoutMarginsRelativeArrangement = true
      stackView.layoutMargins = newValue
    }
  }
  
  /// Create an instance
  /// - Parameter axis: Scroll direction
  public init(axis: NSLayoutConstraint.Axis) {
    super.init(frame: .zero)
    stackView.axis = axis
    setupUI()
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
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupUI() {
    addSubview(stackView)
    stackView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
}
