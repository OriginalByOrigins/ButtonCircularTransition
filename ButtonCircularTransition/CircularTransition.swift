//
//  CircularTransition.swift
//  ButtonCircularTransition
//
//  Created by Harry Cao on 16/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

class CircularTransition: NSObject, UIViewControllerAnimatedTransitioning {
  enum TransitionMode: Int {
    case present, dismiss
  }
  
  var transitionMode: TransitionMode!
  var shrunkPoint: CGPoint!
  var color: UIColor!
  var circle: UIView!
  
  var presentDuration = 0.5
  var dismissDuration = 0.3
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return transitionMode == .present ? presentDuration : dismissDuration
  }
  
  func frameForCircleWith(center: CGPoint, size: CGSize) -> CGRect {
    let lengthX = max(center.x, size.width - center.x)
    let lengthY = max(center.y, size.height - center.y)
    let circleRadius = sqrt(pow(lengthX, 2) + pow(lengthY, 2))
    let surroundingSquareSide = circleRadius * 2
    return CGRect(origin: .zero, size: CGSize(width: surroundingSquareSide, height: surroundingSquareSide))
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let containerView = transitionContext.containerView
    
    if transitionMode == .present {
      
      // Get view of VC being presented
      guard let presentedView = transitionContext.view(forKey: .to) else { return }
      let originalCenter = presentedView.center
      let originalSize = presentedView.frame.size
      
      // Get frame of circle
      circle = UIView()
      circle.frame = frameForCircleWith(center: shrunkPoint, size: originalSize)
      circle.layer.cornerRadius = circle.frame.size.width/2
      circle.center = shrunkPoint
      
      // Make it very small and set bg
      circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
      circle.backgroundColor = color
      
      // Set presented view
      presentedView.center = shrunkPoint
      presentedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
      presentedView.backgroundColor = color
      
      // Add circle presentedView to containerView
      containerView.addSubview(circle)
      containerView.addSubview(presentedView)
      
      // Animate both views
      UIView.animate(withDuration: presentDuration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
        self.circle.transform = .identity
        presentedView.transform = .identity
        presentedView.center = originalCenter
      }, completion: { (completed) in
        self.circle.removeFromSuperview()
        transitionContext.completeTransition(completed)
      })
      
    } else {
      
      // Get view of VC being dismisses
      guard let dismissedView = transitionContext.view(forKey: .from) else { return }
//      let originalCenter = dismissedView.center
      let originalSize = dismissedView.frame.size
      
      // Get frame of circle
      circle.frame = frameForCircleWith(center: shrunkPoint, size: originalSize)
      circle.layer.cornerRadius = circle.frame.size.width/2
      circle.center = shrunkPoint
      containerView.addSubview(circle)
      
      
      // Animate both views
      UIView.animate(withDuration: presentDuration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
        self.circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        dismissedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        dismissedView.center = self.shrunkPoint
      }, completion: { (completed) in
        self.circle.removeFromSuperview()
        dismissedView.removeFromSuperview()
        transitionContext.completeTransition(completed)
      })
      
    }
  }
}
