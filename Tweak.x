/*
 * Tweak.xm
 * FreeMarket
 *
 * Created by Cann66 on 25/07/2023
 * Copyright © 2023 Cann66. All rights reserved.
 */
@interface AppStoreDynamicTypeLabel : UILabel
@property (nonatomic, copy, readwrite) NSString *text;
@end

%hook AppStoreDynamicTypeLabel
  -(void)setFont:(id)arg1 {
    %orig;

    AppStoreDynamicTypeLabel *letsGetSwifty = self;
    if([letsGetSwifty.text isEqualToString:@"GET"]) {
      letsGetSwifty.text = @"FREE";
    }
  }
%end

%ctor {
  %init(_ungrouped, AppStoreDynamicTypeLabel = NSClassFromString(@"AppStore.DynamicTypeLabel"));
}
