//
//  ViewController.swift
//  VPNDetector
//
//  Created by noppefoxwolf on 05/23/2018.
//  Copyright (c) 2018 noppefoxwolf. All rights reserved.
//

import UIKit
import VPNDetector

final class ViewController: UIViewController {
  private lazy var label: UILabel = .init(frame: view.bounds)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    label.textAlignment = .center
    view.addSubview(label)
    
    let nc = NotificationCenter.default
    nc.addObserver(self,
                   selector: #selector(didBecomeActive),
                   name: .UIApplicationDidBecomeActive,
                   object: nil)
  }
  
  @objc func didBecomeActive(_ notificaiton: Notification) {
    if VPNDetector().isRunning {
      label.text = "🏃‍♂️ Running VPN."
    } else {
      label.text = "🛑 Not running VPN."
    }
  }
}
