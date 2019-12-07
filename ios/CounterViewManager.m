//
//  CounterViewManager.c
//  CounterApp
//
//  Created by 林暐秦 on 2019/12/6.
//  Copyright © 2019 Facebook. All rights reserved.
//
#import "React/RCTBridgeModule.h"
#import "React/RCTViewManager.h"
#import "React/RCTUIManager.h"

@interface RCT_EXTERN_MODULE(CounterViewManager, RCTViewManager)
  RCT_EXPORT_VIEW_PROPERTY(count, NSNumber)
  RCT_EXPORT_VIEW_PROPERTY(onUpdate, RCTDirectEventBlock)
  RCT_EXTERN_METHOD(
    updateFromManager: (nonnull NSNumber *)node
    count: (nonnull NSNumber *)count
  )
@end
