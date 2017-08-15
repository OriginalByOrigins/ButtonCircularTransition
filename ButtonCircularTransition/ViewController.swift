//
//  ViewController.swift
//  ButtonCircularTransition
//
//  Created by Harry Cao on 16/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var secondVCTransition = CircularTransition()
  var tappedButton: UIButton!
  
  lazy var purpleButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor(red: 116/255, green: 78/255, blue: 178/255, alpha: 1)
    button.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
    button.layer.cornerRadius = 40
    button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
    return button
  }()
  
  lazy var tealButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor(red: 126/255, green: 204/255, blue: 296/255, alpha: 1)
    button.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
    button.layer.cornerRadius = 40
    button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
    return button
  }()
  
  lazy var brownButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor(red: 141/255, green: 110/255, blue: 99/255, alpha: 1)
    button.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
    button.layer.cornerRadius = 40
    button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor(red: 255/255, green: 183/255, blue: 77/255, alpha: 1)
    setupButtons()
  }
  
  func setupButtons() {
    self.view.addSubview(purpleButton)
    self.view.addSubview(tealButton)
    self.view.addSubview(brownButton)
    
    purpleButton.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/5)
    tealButton.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height*2/5)
    brownButton.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height*3/5)
    
  }
}

