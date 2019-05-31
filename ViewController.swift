//
//  ViewController.swift
//  CircularIndicator
//
//  Created by Priyesh on 30/05/19.

import UIKit

class ViewController: UIViewController {

  var shapeLayer1 = CAShapeLayer()
  var shapeLayer2 = CAShapeLayer()
  var shapeLayer3 = CAShapeLayer()
  
  let lineWidth:CGFloat = 20
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .black
    
    //Add BG layer for each shape layer:
    addBackgroundLayer(radius: 100, startAngle: 0, endAngle: 2*CGFloat.pi, color: UIColor.red, clockWise: true)
    shapeLayer1 = getShapeLayer(radius: 100, startAngle: -CGFloat.pi/2, endAngle: 3*CGFloat.pi/4, color: UIColor.red, clockWise: true)
    
    addBackgroundLayer(radius: 80, startAngle: 0, endAngle: 2*CGFloat.pi, color: UIColor.green, clockWise: true)
    shapeLayer2 = getShapeLayer(radius: 80, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi/2, color: UIColor.green, clockWise: true)
    
    addBackgroundLayer(radius: 60, startAngle: 0, endAngle: 2*CGFloat.pi, color: UIColor.cyan, clockWise: true)
    shapeLayer3 = getShapeLayer(radius: 60, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi/4, color: UIColor.cyan, clockWise: true)
    

    view.layer.addSublayer(shapeLayer1)
    view.layer.addSublayer(shapeLayer2)
    view.layer.addSublayer(shapeLayer3)
    
    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    animate()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @objc private func handleTap() {
    animate()
  }
  
  private func animate() {
    let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    basicAnimation.toValue = 1
    basicAnimation.duration = 1.5
    basicAnimation.fillMode = CAMediaTimingFillMode.forwards
    basicAnimation.isRemovedOnCompletion = false
    shapeLayer1.add(basicAnimation, forKey: "layer1Animation")
    shapeLayer2.add(basicAnimation, forKey: "layer2Animation")
    shapeLayer3.add(basicAnimation, forKey: "layer3Animation")
  }
  
  private func getShapeLayer(radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, color: UIColor,clockWise: Bool) -> CAShapeLayer {
    let circularPath = UIBezierPath(arcCenter: view.center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockWise)
    let shapeLayer = CAShapeLayer()
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.path = circularPath.cgPath
    shapeLayer.strokeColor = color.cgColor
    shapeLayer.lineWidth = lineWidth
    shapeLayer.lineCap = CAShapeLayerLineCap.round
    shapeLayer.strokeEnd = 0
    return shapeLayer
  }
  
  private func addBackgroundLayer(radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, color: UIColor,clockWise: Bool) {
    let backgroundLayer = CAShapeLayer()
    let fullCirclePath =  UIBezierPath(arcCenter: view.center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockWise)
    backgroundLayer.path = fullCirclePath.cgPath
    backgroundLayer.fillColor = UIColor.clear.cgColor
    backgroundLayer.lineWidth = lineWidth
    backgroundLayer.strokeColor = color.withAlphaComponent(0.3).cgColor
    view.layer.addSublayer(backgroundLayer)
  }

}

