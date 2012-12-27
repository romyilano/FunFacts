//
//  ViewController.m
//  FunFacts-Mine
//
//  Created by Romy Ilano on 12/27/12.
//  Copyright (c) 2012 Romy Ilano. All rights reserved.
//

#import "SocialViewController.h"

// define keys for the dictionary from the plist
#define AuthorFactsKey      @"facts"
#define AuthorImageKey      @"image"
#define AuthorNameKey       @"name"
#define AuthorTwitterKey    @"twitter"

@interface SocialViewController ()
{
  
}
// class extension
// reference to the FactsList, which is a plist that's structured as an array
@property (strong, nonatomic) NSArray *authorsArray;

@end

@implementation SocialViewController
#pragma mark-App Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"Authors Array = %@", self.authorsArray);
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
-(IBAction)actionTapped
{
    
}

-(IBAction)socialTapped:(id)sender
{
    
}

#pragma mark-Shake



-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(motion==UIEventSubtypeMotionShake) {
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
