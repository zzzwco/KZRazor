//
//  KZScrollView.swift
//  KZRazor
//
//  Created by zzzwco on 2021/9/28.
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

public typealias KZScrollView = UIScrollView

public extension KZWrapper where T: KZScrollView {
  
  @discardableResult
  func delegate(_ delegate: UIScrollViewDelegate?) -> T {
    base.delegate = delegate
    return base
  }
  
  @discardableResult
  func contentSize(_ contentSize: CGSize) -> T {
    base.contentSize = contentSize
    return base
  }
  
  @discardableResult
  func contentOffset(_ contentOffset: CGPoint) -> T {
    base.contentOffset = contentOffset
    return base
  }
  
  @discardableResult
  func contentInset(_ contentInset: UIEdgeInsets) -> T {
    base.contentInset = contentInset
    return base
  }
  
  @discardableResult
  func contentInsetAdjustmentBehavior(_ contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior) -> T {
    base.contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior
    return base
  }
  
  @discardableResult
  func isScrollEnabled(_ isScrollEnabled: Bool) -> T {
    base.isScrollEnabled = isScrollEnabled
    return base
  }
  
  @discardableResult
  func isPagingEnabled(_ isPagingEnabled: Bool) -> T {
    base.isPagingEnabled = isPagingEnabled
    return base
  }
  
  @discardableResult
  func scrollsToTop(_ scrollsToTop: Bool) -> T {
    base.scrollsToTop = scrollsToTop
    return base
  }
  
  @discardableResult
  func bounces(_ bounces: Bool) -> T {
    base.bounces = bounces
    return base
  }
  
  @discardableResult
  func alwaysBounceHorizontal(_ alwaysBounceHorizontal: Bool) -> T {
    base.alwaysBounceHorizontal = alwaysBounceHorizontal
    return base
  }
  
  @discardableResult
  func alwaysBounceVertical(_ alwaysBounceVertical: Bool) -> T {
    base.alwaysBounceVertical = alwaysBounceVertical
    return base
  }
  
  @discardableResult
  func indicatorStyle(_ indicatorStyle: UIScrollView.IndicatorStyle) -> T {
    base.indicatorStyle = indicatorStyle
    return base
  }
  
  @discardableResult
  func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool) -> T {
    base.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
    return base
  }
  
  @discardableResult
  func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool) -> T {
    base.showsVerticalScrollIndicator = showsVerticalScrollIndicator
    return base
  }
  
  @available(iOS 11.1, *)
  @discardableResult
  func horizontalScrollIndicatorInsets(_ horizontalScrollIndicatorInsets: UIEdgeInsets) -> T {
    base.horizontalScrollIndicatorInsets = horizontalScrollIndicatorInsets
    return base
  }
  
  @available(iOS 11.1, *)
  @discardableResult
  func verticalScrollIndicatorInsets(_ verticalScrollIndicatorInsets: UIEdgeInsets) -> T {
    base.verticalScrollIndicatorInsets = verticalScrollIndicatorInsets
    return base
  }
  
  @available(iOS 13.0, *)
  @discardableResult
  func automaticallyAdjustsScrollIndicatorInsets(_ automaticallyAdjustsScrollIndicatorInsets: Bool) -> T {
    base.automaticallyAdjustsScrollIndicatorInsets = automaticallyAdjustsScrollIndicatorInsets
    return base
  }
  
  @discardableResult
  func refreshControl(_ refreshControl: UIRefreshControl?) -> T {
    base.refreshControl = refreshControl
    return base
  }
  
  @discardableResult
  func flashScrollIndicators() -> T {
    base.flashScrollIndicators()
    return base
  }
}
