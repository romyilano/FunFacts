//
//  FunActivity.h
//  FunFacts-Mine
//
//  Created by Romy Ilano on 12/27/12.
//  Copyright (c) 2012 Romy Ilano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FunActivity : UIActivity

@property (strong, nonatomic) UIImage *authorImage;
@property (strong, nonatomic) NSString *funFactText;


// Override these UIActivity Methods
// 1 - image to be shown for your custom activity inside the activity view
-(UIImage *)activityImage;
// 2 - title to be shown inside the activity view
-(NSString *)activityTitle;
// 3 - identifier (apple recommends using something similar to your Bundle ID) that identifies your unique activity so you can easily reuse it in other projects or have several custom activities without them conflicting with each other
-(NSString *)activityType;
// 4 - an array of items that you need to check to see if you support them and if you can perform actions on them
-(BOOL)canPerformWithActivityItems:(NSArray *)activityItems;
// 5 - if you do support items received in prepareWithActivityItems: here is where you can prepare those items  and store them bfore performing the action
-(void)prepareWithActivityItems:(NSArray *)activityItems;
// 6 - user tapped activity button corresponding to your custom activity - time to execute the custom activity on the items previously received
-(void)performActivity;

@end
