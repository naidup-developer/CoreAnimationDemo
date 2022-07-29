//
//  ViewController.swift
//  CoreAnimationDemo
//
//  Created by Chanti on 29/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    var myView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 100, height: 100))
        myView.frame = frame
        myView.backgroundColor = .black
        self.view.addSubview(myView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = CGPoint.zero
        animation.toValue = view.bounds.size.width
        animation.duration = 0.5
        animation.beginTime = CACurrentMediaTime() + 0.3
        animation.repeatCount = 4
        animation.autoreverses = true
        
        myView.layer.add(animation, forKey: nil)
    }

}

