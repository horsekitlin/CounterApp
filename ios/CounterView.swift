//
//  CounterView.swift
//  CounterApp
//
//  Created by 林暐秦 on 2019/12/6.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit

class CounterView: UIView {
  
   @objc var onUpdate: RCTDirectEventBlock?
  
   @objc var count: NSNumber = 0 {
    didSet {
      button.setTitle(String(describing: count), for: .normal)
    }
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(button)
    increment()
  }
  
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  lazy var button: UIButton = {
    let b = UIButton.init(type: UIButton.ButtonType.system)
    b.titleLabel?.font = UIFont.systemFont(ofSize: 50)
    b.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    b.addTarget(
      self,
      action: #selector(increment),
      for: .touchUpInside
    )
    
    let longPress = UILongPressGestureRecognizer(
      target: self,
      action: #selector(sendUpdate(_:))
    )
    b.addGestureRecognizer(longPress)
    
    return b
  }()
  
  @objc func update(value: NSNumber) {
      count = value
  }
  
  @objc func sendUpdate(_ gesture: UILongPressGestureRecognizer) {
    if gesture.state == .began {
      if onUpdate != nil {
        onUpdate!(["count": count])
      }
    }
  }
  
  @objc func increment() {
    count = count.intValue + 1 as NSNumber
  }
}
