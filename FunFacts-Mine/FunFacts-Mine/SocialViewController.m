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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-Custom Getters
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
@end
