//
//  CounterViewManager.swift
//  CounterApp
//
//  Created by 林暐秦 on 2019/12/6.
//  Copyright © 2019 Facebook. All rights reserved.
//

@objc(CounterViewManager)
class CounterViewManager: RCTViewManager {
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  override func view() -> UIView! {
    return CounterView()
  }
}
