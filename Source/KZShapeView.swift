//
//  KZShapeView.swift
//  KZRazor
//
//  Created by zzzwco on 2021/10/1.
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

open class KZShapeView: UIView {
  
  public enum Shape {
    case line(
      direction: LineDirection, lineWidth: CGFloat, strokeColor: UIColor)
    case round(
      byRoundingCorners: UIRectCorner, cornerRadii: CGSize,
      lineWidth: CGFloat, strokeColor: UIColor,
      fillColor: UIColor? = nil, insets: UIEdgeInsets? = .zero)
    case capsule(
      lineWidth: CGFloat, strokeColor: UIColor,
      fillColor: UIColor? = nil, insets: UIEdgeInsets? = .zero)
    case circle(
      lineWidth: CGFloat, strokeColor: UIColor,
      fillColor: UIColor? = nil, insets: UIEdgeInsets? = .zero)
    case oval(
      lineWidth: CGFloat, strokeColor: UIColor,
      fillColor: UIColor? = nil, insets: UIEdgeInsets? = .zero)
    
    public enum LineDirection {
      case horizontal
      case vertical
      case custom(startPoint: CGPoint, endPoint: CGPoint)
    }
  }
  
  private var shapeLayer = CAShapeLayer()
  private var path = UIBezierPath()
  private var shape: Shape!
  private var lineDashPattern: [NSNumber]?
  private var isMasked: Bool = false
  
  public init(shape: Shape, lineDashPattern: [NSNumber]? = nil, isMasked: Bool = false,
              lineCap: CAShapeLayerLineCap? = nil, lineJoin: CAShapeLayerLineJoin? = nil) {
    super.init(frame: .zero)
    self.shape = shape
    self.isMasked = isMasked
    self.lineDashPattern = lineDashPattern
    if let lineCap = lineCap {
      shapeLayer.lineCap = lineCap
    }
    if let lineJoin = lineJoin {
      shapeLayer.lineJoin = lineJoin
    }
    setupUI()
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    setupPath()
    shapeLayer.path = path.cgPath
  }
  
  func setupUI() {
    let shapleLayerConfig: (CAShapeLayer, CGFloat, UIColor, UIColor?) -> () = {
      layer, lineWidth, strokeColor, fillColor in
      layer.lineWidth = lineWidth
      layer.strokeColor = strokeColor.cgColor
      layer.fillColor = fillColor?.cgColor
    }
    switch shape {
    case .line(_, let lineWidth, let strokeColor):
      shapleLayerConfig(shapeLayer, lineWidth, strokeColor, nil)
    case let .round(_, _, lineWidth, strokeColor, fillColor, _):
      shapleLayerConfig(shapeLayer, lineWidth, strokeColor, fillColor)
    case .capsule(let lineWidth, let strokeColor, let fillColor, _):
      shapleLayerConfig(shapeLayer, lineWidth, strokeColor, fillColor)
    case .circle(let lineWidth, let strokeColor, let fillColor, _):
      shapleLayerConfig(shapeLayer, lineWidth, strokeColor, fillColor)
    case .oval(let lineWidth, let strokeColor, let fillColor, _):
      shapleLayerConfig(shapeLayer, lineWidth, strokeColor, fillColor)
    case .none:
      break
    }
    shapeLayer.lineDashPattern = lineDashPattern
    if isMasked {
      self.layer.mask = shapeLayer
    } else {
      self.layer.addSublayer(shapeLayer)
    }
  }
  
  func setupPath() {
    switch shape {
    case .line(let direction, _, _):
      switch direction {
      case .horizontal:
        path.move(to: .init(x: 0, y: bounds.midY))
        path.addLine(to: .init(x: bounds.maxX, y: bounds.midY))
      case .vertical:
        path.move(to: .init(x: bounds.midX, y: 0))
        path.addLine(to: .init(x: bounds.midX, y: bounds.maxY))
      case let .custom(startPoint, endPoint):
        path.move(to: .init(x: startPoint.x * bounds.width, y: startPoint.y * bounds.height))
        path.addLine(to: .init(x: endPoint.x * bounds.width, y: endPoint.y * bounds.height))
      }
    case let .round(byRoundingCorners, cornerRadii, _, _, _, insets):
      path = UIBezierPath(
        roundedRect: bounds.inset(by: insets ?? .zero),
        byRoundingCorners: byRoundingCorners, cornerRadii: cornerRadii)
    case .capsule(_, _, _, let insets):
      let rect = bounds.inset(by: insets ?? .zero)
      let w = bounds.height - (insets?.top ?? 0) - (insets?.bottom ?? 0) * 0.5
      let h = bounds.height - (insets?.top ?? 0) - (insets?.bottom ?? 0) * 0.5
      let radii = CGSize(width: w, height: h)
      path = UIBezierPath(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: radii)
    case .circle(_, _, _, let insets):
      KZPrint.log(message: bounds.inset(by: insets ?? .zero).width, bounds.inset(by: insets ?? .zero).height)
      path = UIBezierPath(
        arcCenter: .init(x: bounds.inset(by: insets ?? .zero).midX,
                         y: bounds.inset(by: insets ?? .zero).midY),
        radius: min(bounds.inset(by: insets ?? .zero).width,
                    bounds.inset(by: insets ?? .zero).height) * 0.5,
        startAngle: 0, endAngle: .pi * 2, clockwise: false)
    case .oval(_, _, _, let insets):
      path = UIBezierPath(ovalIn: bounds.inset(by: insets ?? .zero))
    case .none:
      break
    }
  }
}
