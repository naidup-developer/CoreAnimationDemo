//
//  ViewController.swift
//  CoreAnimationDemo
//
//  Created by Chanti on 29/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    var myView = UIView()
    
    var shapeLayer: CAShapeLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(origin: view.center, size: CGSize(width: 100, height: 100))
        myView.frame = frame
        myView.backgroundColor = .black
        self.view.addSubview(myView)
        
        let shapelayer = CAShapeLayer()
        
        view.layer.addSublayer(shapelayer)
        self.shapeLayer = shapelayer
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.strokeColor = UIColor.blue.cgColor
//        shapeLayer.path = getBezierPath().cgPath
        springAnimation()
    }
    
    func getBezierPath () -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: view.center)
        
        path.addCurve(to: view.center,
                      controlPoint1: CGPoint(x: view.center.x + 150, y: view.center.y + 150),
                      controlPoint2: CGPoint(x: view.center.x - 150, y: view.center.y - 150))
        path.lineWidth = 2
        return path
        
    }
    
    func basicAnimation() {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = CGPoint.zero
        animation.toValue = view.bounds.size.width
        animation.duration = 0.5
        animation.beginTime = CACurrentMediaTime() + 0.3
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.delegate = self
        myView.layer.add(animation, forKey: nil)
    }
    
    func springAnimation() {
        let jump = CASpringAnimation(keyPath: "transform.scale")
        jump.damping = 10
        jump.mass = 1
        jump.initialVelocity = 100
        jump.stiffness = 1500.0
        jump.fromValue = 1.0
        jump.toValue = 2.0
        jump.duration = jump.settlingDuration
        jump.repeatCount = 4
        myView.layer.add(jump, forKey: nil)
    }

}

extension ViewController: CAAnimationDelegate {
    func animationDidStart(_ anim: CAAnimation) {
        print("Animation started")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("Animation stopped", flag)
    }
}

