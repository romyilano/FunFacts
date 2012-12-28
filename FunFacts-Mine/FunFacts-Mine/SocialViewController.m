//
//  ViewController.m
//  FunFacts-Mine
//
//  Created by Romy Ilano on 12/27/12.
//  Copyright (c) 2012 Romy Ilano. All rights reserved.
//

#import "SocialViewController.h"
#import "FunActivity.h"
#import <QuartzCore/QuartzCore.h>

// define keys for the dictionary from the plist
#define AuthorFactsKey      @"facts"
#define AuthorImageKey      @"image"
#define AuthorNameKey       @"name"
#define AuthorTwitterKey    @"twitter"

// add an enumerator declaration
// enumerator is used so you can easily check for tags of the buttons without having to use numbers that may not make much sense or provide clarity as to which button you're working with
typedef enum SocialButtonTags
{
    SocialButtonTagFacebook,
    SocialButtonTagSinaWeibo,
    SocialButtonTagTwitter
} SocialButtonTags;


@interface SocialViewController ()
{
  
}
// class extension
// reference to the FactsList, which is a plist that's structured as an array
@property (strong, nonatomic) NSArray *authorsArray;
// setting a boolean so we can tell if the device was shaken or not
// this will help prevent getting the default text to show up on the social posting 
@property (assign, nonatomic) BOOL deviceWasShaken;

@end

@implementation SocialViewController
#pragma mark-App Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.authorBackgroundView.layer.borderWidth = 1.0f;
    self.authorBackgroundView.layer.borderColor=[[UIColor colorWithWhite:0.2 alpha:1.0] CGColor];
    self.authorBackgroundView.layer.cornerRadius = 10.0f;
    self.authorBackgroundView.layer.masksToBounds = YES;
    
    self.authorImageView.contentMode=UIViewContentModeScaleAspectFit;
    self.authorImageView.image = [UIImage imageNamed:@"funfacts.png"];
    self.authorImageView.layer.borderWidth = 1.0f;
    self.authorImageView.layer.borderColor=[[UIColor colorWithWhite:0.2 alpha:1.0] CGColor];
    self.authorImageView.layer.shadowColor=[[UIColor colorWithWhite:0.75 alpha:1.0] CGColor];
    self.authorImageView.layer.shadowOffset=CGSizeMake(-1.0f, -1.0f);
    
    self.authorImageView.layer.shadowOpacity=0.5f;
    
    self.factTextView.text =@"Shake to get a Fun Fact from a random iOS6 By Tutorials author or editor!";
    self.factTextView.layer.borderWidth=1.0f;
    self.factTextView.layer.borderColor=[[UIColor colorWithWhite:0.2 alpha:1.0]CGColor];
    self.factTextView.layer.cornerRadius=10.0f;
    self.factTextView.layer.masksToBounds=YES;
    self.factTextView.layer.shadowColor=[[UIColor colorWithWhite:0.75 alpha:1.0] CGColor];
    self.factTextView.layer.shadowOffset=CGSizeMake(-1.0f, -1.0f);
    
    self.factTextView.layer.shadowOpacity=0.5f;
    
    self.factTitleLabel.hidden=YES;
    
    self.nameLabel.text = self.twitterLabel.text=@"";
    
    [self.actionButton setBackgroundImage:[[UIImage imageNamed:@"button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 12, 0, 12)] forState:UIControlStateNormal];
    [self.facebookButton setBackgroundImage:[[UIImage imageNamed:@"button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 12, 0, 12)] forState:UIControlStateNormal];
    [self.twitterButton setBackgroundImage:[[UIImage imageNamed:@"button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 12, 0, 12)] forState:UIControlStateNormal];
    [self.weiboButton setBackgroundImage:[[UIImage imageNamed:@"button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 12, 0, 12)] forState:UIControlStateNormal];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];

}

// I need to set it as becomeFirstResponder YES
-(BOOL)canBecomeFirstResponder
{
    return YES;
}

// need to set this becomeFirstResponder before i can shake
-(void)viewDidAppear:(BOOL)animated
{
    [self becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-Custom Getters for Lazy Loading
// this is an example of lazy loading for the FunFacts plist. i think this makes the app run faster
-(NSArray *)authorsArray
{
    if(!_authorsArray) {
        NSString *authorsArrayPath = [[NSBundle mainBundle] pathForResource:@"FactsList" ofType:@"plist"];
        self.authorsArray=[NSArray arrayWithContentsOfFile:authorsArrayPath];
    }
    return _authorsArray;
}


#pragma mark-Actions
// now actionTapped: creates an instance of FunActivity and passes it to initWithActivityItems:applicationActivities: as a parameter
// this saves the activity as an image to your photo album
-(IBAction)actionTapped
{

    if (self.deviceWasShaken)
    {
        FunActivity *funActivity = [[FunActivity alloc] init];
        
        NSString *initialTextString = [NSString stringWithFormat:@"Fun Fact: %@", self.factTextView.text];
        
        UIActivityViewController *activityViewController = [[UIActivityViewController alloc]
                                                            initWithActivityItems:@[self.authorImageView.image, initialTextString] applicationActivities:@[funActivity]];
        
        [self presentViewController:activityViewController animated:YES completion:nil];
    } else
    {
        //
    }
}

-(IBAction)socialTapped:(id)sender
{
    if(self.deviceWasShaken)
    {
        // 1 - creats an empty string to store the service type to be used for sharing. this string will be filled out shortly 
        NSString *serviceType = @"";
        
        // 2 - switch statement based on the button's tag.
        //      notice that the sender object is cast to a UIButton in order to retrieve its tag. It's perfectly legal, since you know the sender is definitely a button. Depending on the button's tag, appropriate service type is assigned ot the string.
        //  notice that the enumerator is much more verbose than using the 0, 1, and 2 for tags
        switch (((UIButton *)sender).tag)
        {
            case SocialButtonTagFacebook:
                serviceType = SLServiceTypeFacebook;
                break;
            case SocialButtonTagSinaWeibo:
                serviceType = SLServiceTypeSinaWeibo;
                break;
            case SocialButtonTagTwitter:
                serviceType = SLServiceTypeTwitter;
                break;
            
            default:
                break;
        }
        
        // 3 with the service type string acquired, the code checks to see if the service is avialable to the user.
        // the main reason it may not be avialable is if an account for the service hasn't been set up via the Settings app.
        if (![SLComposeViewController isAvailableForServiceType:serviceType])
        {
            // 4
            [self showUnavailableAlertForServiceType:serviceType];
            
        } else {
            // 5 - nice- the enumerator helped select the service type
            SLComposeViewController *composeViewController = [SLComposeViewController composeViewControllerForServiceType:serviceType];
            // add the author's image
            [composeViewController addImage:self.authorImageView.image];
            // add the initial text string
            NSString *initialTextString = [NSString stringWithFormat:@"Fun Fact: %@", self.factTextView.text];
            
            [composeViewController setInitialText:initialTextString];
            
            [self presentViewController:composeViewController animated:YES completion:nil];
        
        }
    }
    
    else
    {
        // 6
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Shake"
                                                            message:@"Before you can share, please shake the device in order to get a random Fun Fact"
                                                           delegate:nil
                                                  cancelButtonTitle:@"Dismiss"
                                                  otherButtonTitles: nil];
        
        [alertView show];
    }
}

#pragma mark - Custom Methods
-(void)showUnavailableAlertForServiceType:(NSString *)serviceType
{
    NSString *serviceName = @"";
    
    if (serviceType == SLServiceTypeFacebook) {
        serviceName = @"Facebook";
    }
    else if (serviceType == SLServiceTypeSinaWeibo)
    {
        serviceName = @"Sina Weibo";
    }
    else if (serviceType == SLServiceTypeTwitter)
    {
        serviceName = @"Twitter";
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Account" message:[NSString stringWithFormat:@"Please Go to the device settings and add a %@ account in order to share through that service", serviceName] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
    [alertView show];
}

#pragma mark-Shake



-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(motion==UIEventSubtypeMotionShake) {
        
        
        self.deviceWasShaken=YES;
        
        // 1 - choose a random author
        NSUInteger authorRandSize = self.authorsArray.count;
        NSUInteger authorRandomIndex =  (arc4random() % ((unsigned) authorRandSize));
        
        // 2 - using random index for an author int he array, the dictionary corresponding to the author is retrieved from the self.authorsArray property and stored in an NSDictionary called authorDictionary
        NSDictionary *authorDictionary = self.authorsArray[authorRandomIndex];
        
        // 3 - Using the #defines you set up earlier, pulls out information
        //  about the author from the dictionary.
        // Note that this is new literal syntax
        NSArray *facts = authorDictionary[AuthorFactsKey];
        NSString *image = authorDictionary[AuthorImageKey];
        NSString *name = authorDictionary[AuthorNameKey];
        NSString *twitter = authorDictionary[AuthorTwitterKey];
        
        // 4 - another random index has to be called to pull a random fact about the current author
        NSUInteger factsRandSize = facts.count;
        NSUInteger factsRandomIndex = (arc4random() % ((unsigned) factsRandSize));
        
        // 5 - title label is unhidden
        //      appropriate UI elements are populated with the randomly acquired author data
        self.factTitleLabel.hidden=NO;
        self.factTextView.text = facts[factsRandomIndex];
        self.nameLabel.text =  name;
        self.twitterLabel.text = twitter;
        self.authorImageView.image = [UIImage imageNamed:image];
        
    }
}


@end
