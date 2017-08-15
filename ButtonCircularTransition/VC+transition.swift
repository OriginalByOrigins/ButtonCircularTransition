//
//  VC+transition.swift
//  ButtonCircularTransition
//
//  Created by Harry Cao on 17/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

/**
 Conform to UIViewControllerTransitioningDelegate to performs custom transisioning animation
 */
extension ViewController: UIViewControllerTransitioningDelegate {
  
  @objc
  func handleButtonTapped(_ sender: UIButton) {
    let secondVC = SecondViewCViewController()
    
    tappedButton = sender
    
    secondVC.view.backgroundColor = sender.backgroundColor
    secondVC.dismissButton.frame = sender.frame
    secondVC.transitioningDelegate = self
    secondVC.modalPresentationStyle = .custom
    present(secondVC, animated: true) {
      // maydo smth
    }
  }
  
  // Custom presentation animation
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    secondVCTransition.transitionMode = .present
    secondVCTransition.shrunkPoint = tappedButton.center
    secondVCTransition.color = tappedButton?.backgroundColor
    return secondVCTransition
  }
  
  // Custom dismission animation
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    secondVCTransition.transitionMode = .dismiss
    secondVCTransition.shrunkPoint = tappedButton.center
    secondVCTransition.color = tappedButton?.backgroundColor
    return secondVCTransition
  }
}
