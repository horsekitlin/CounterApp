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
  
    @objc func updateFromManager(_ node: NSNumber, count: NSNumber) {
      
      DispatchQueue.main.async {                                // 2
        let component = self.bridge.uiManager.view(             // 3
          forReactTag: node                                     // 4
        ) as! CounterView                                       // 5
        component.update(value: count)                          // 6
      }
    }
}
