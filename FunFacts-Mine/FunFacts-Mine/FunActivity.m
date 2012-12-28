//
//  FunActivity.m
//  FunFacts-Mine
//
//  Created by Romy Ilano on 12/27/12.
//  Copyright (c) 2012 Romy Ilano. All rights reserved.
//

#import "FunActivity.h"
#import <QuartzCore/QuartzCore.h>

@implementation FunActivity

-(UIImage *)activityImage
{
    // style is similar to the images used by bar button and tab bar items.
    // it's a black and white image with alpha
    // size is same as a regular iphone app icon: 57x57 or 114x114
    return [UIImage imageNamed:@"activity.png"];
}

-(NSString *)activityTitle
{
    return @"Save Quote to Photos";
}

-(NSString *)activityType
{
    // the author's standard bundle identifier along with quote.view
    return @"com.snowyla.FunFacts-Mine.quoteView";
  
}

-(BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    // loops through each of the items in the activity items array
    //      and checks whether it's a UIImage or NSString
    for (int i=0; i < activityItems.count; i++ )
    {
        id item = activityItems[i];
        
        // if it's not a string or an image it returns NO
        if ([item class] == [UIImage class] || [item isKindOfClass:[NSString class]])
        {
            // don't need to do anything here
        } else
        {
            return NO;
        }
    }
    // if everything is OK return YES - indicates it can perform an action with the received items
    return YES;
}

// loop through each of the activity items
//  store image and text inside the properties that were previously declared
-(void)prepareWithActivityItems:(NSArray *)activityItems
{
    for (int i=0; i< activityItems.count; i++)
    {
        id item = activityItems[i];
        
        if ([item class] == [UIImage class])
        {
            self.authorImage=item;
        }
        else if ([item isKindOfClass:[NSString class]])
        {
            self.funFactText= item;
        }
    }
}

// called when user has requested to perform the activity you're creating
-(void)performActivity
{
    // create a quote size - it will be 640x960
    CGSize quoteSize = CGSizeMake(640, 960);
    
    // begin the graphics context and make it set to the quote Size (640x960)
    UIGraphicsBeginImageContext(quoteSize);
    
    // programmatically create a quoteView
    // Create a UIView quoteView whose frame is the size of the quoteSize. Note that here the coordinates are simply 0,0
    UIView *quoteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, quoteSize.width, quoteSize.height)];
    
    // set the background color of the quoteView to black
    quoteView.backgroundColor = [UIColor blackColor];
    
    // init imageView with the author's portrait image
    // programmatically create an ImageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.authorImage];
    imageView.frame=CGRectMake(20, 20, 600, 320);
    imageView.backgroundColor = [UIColor clearColor];
    imageView.contentMode=UIViewContentModeScaleAspectFit;
    // add the imageView as a subview to the QuoteView
    [quoteView addSubview:imageView];
    
    // programmatically create a UILabel
    UILabel *factLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 360, 600, 600)];
    factLabel.backgroundColor=[UIColor clearColor];
    factLabel.numberOfLines=10;
    factLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:44];
    factLabel.textColor = [UIColor whiteColor];
    factLabel.text = self.funFactText;
    factLabel.textAlignment=NSTextAlignmentCenter;
    // add the factLabel view as a subView to the quoteView
    [quoteView addSubview:factLabel];
    
    // render the quoteView layer in the current context
    //  layer> the view's Core Animation Layer is used for rendering
    [quoteView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *imageToSave = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil);
    
    [self activityDidFinish:YES];
}

@end
