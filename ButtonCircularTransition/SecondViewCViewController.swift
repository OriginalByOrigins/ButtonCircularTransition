//
//  SecondViewCViewController.swift
//  ButtonCircularTransition
//
//  Created by Harry Cao on 16/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

class SecondViewCViewController: UIViewController {
  
  lazy var dismissButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor(red: 255/255, green: 183/255, blue: 77/255, alpha: 1)
    button.setTitle("X", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 35, weight: .light)
    button.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
    button.layer.cornerRadius = 40
    button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    self.view.addSubview(dismissButton)
  }
  
  @objc
  func handleButtonTapped() {
    self.dismiss(animated: true, completion: nil)
  }
  
}
