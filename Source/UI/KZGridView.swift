//
//  KZGridView.swift
//  KZRazor
//
//  Created by zzzwco on 2021/9/26.
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

open class KZGridView: UIView {
  
  /// Call it after other properties all set.
  @discardableResult
  public func refreshUI() -> Self {
    self._refreshUI()
    return self
  }
  
  @discardableResult
  public func columnsCount(_ count: Int) -> Self {
    self.columnsCount = count
    return self
  }
  
  @discardableResult
  public func rowHeight(_ height: CGFloat) -> Self {
    self.rowHeight = height
    return self
  }
  
  /// Whether height equals height.
  /// - Parameter isEqual: If set true, `rowHeight` is useless.
  /// - Returns: `KZGridView`.
  @discardableResult
  public func isHeightEqualToWidth(_ isEqual: Bool) -> Self {
    self.isHeightEqualToWidth = isHeightEqualToWidth
    return self
  }
  
  @discardableResult
  public func padding(_ padding: UIEdgeInsets) -> Self {
    self.padding = padding
    return self
  }
        
  @discardableResult
  public func xSpacing(_ spacing: CGFloat) -> Self {
    self.xSpacing = spacing
    return self
  }
          
  @discardableResult
  public func ySpacing(_ spacing: CGFloat) -> Self {
    self.ySpacing = spacing
    return self
  }
            
  @discardableResult
  public func elementViews(_ views: [UIView]) -> Self {
    self.elementViews = views
    return self
  }
  
  @discardableResult
  public func isScrollEnabled(_ isScrollEnabled: Bool) -> Self {
    self.contentSV.isScrollEnabled = isScrollEnabled
    return self
  }
  
  /// Get content height.
  public var contentHeight: CGFloat {
    get {
      let rows = (elementViews.count + columnsCount - 1) / columnsCount
      return padding.top + padding.bottom + ySpacing * CGFloat(rows - 1) + itemHeight * CGFloat(rows)
    }
  }
  
  public var columnsCount: Int = 0
  public var rowHeight: CGFloat = 0
  public var isHeightEqualToWidth: Bool = false
  public var padding: UIEdgeInsets = .zero
  public var xSpacing: CGFloat = 0
  public var ySpacing: CGFloat = 0
  public var elementViews: [UIView] = []
  
  private let contentSV = UIScrollView()
  private var itemWidth: CGFloat {
    (bounds.size.width - padding.left - padding.right -
     CGFloat(columnsCount - 1) * xSpacing) / CGFloat(columnsCount)
  }
  private var itemHeight: CGFloat {
    isHeightEqualToWidth ? itemWidth : rowHeight
  }
  
  public init(columnsCount: Int) {
    super.init(frame: .zero)
    self.columnsCount = columnsCount
    addSubview(contentSV)
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    
    if elementViews.isEmpty { return }
    contentSV.frame = bounds.inset(by: padding)
    contentSV.contentSize = .init(width: 0, height: contentHeight)
    _ = elementViews.enumerated().map { i, v in
      let row = i / columnsCount
      let col = i % columnsCount
      let x = (itemWidth + xSpacing) * CGFloat(col)
      let y = (itemHeight + ySpacing) * CGFloat(row)
      v.frame = .init(x: x, y: y, width: itemWidth, height: itemHeight)
    }
  }
  
  func _refreshUI() {
    self.contentSV.subviews.forEach { $0.removeFromSuperview() }
    self.elementViews.forEach { contentSV.addSubview($0) }
    self.setNeedsLayout()
    self.layoutIfNeeded()
  }
}
