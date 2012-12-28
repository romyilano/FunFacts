# Fun Facts

Social Frameworks tutorial from RayWenderlich.com - with many learnings. Going to resuse this in Bento Rock. Thank you teachers!

# Branch 5 - Styling the UI

## Excellent example of customized UI

in SocialViewController.m - viewDidLoad:

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


# Branch 4 - Creating a Custom Activity

p 778
Note: You can only add a custom activity to activity views inside your own app. There is currently no way to register your own activity that can be called on other apps.

Here we will make a custom activity that allows the user to save a fun fact to the Photos library!

* To Create a custom activity you need to subclass UIActivity (FunActivity)

## Uses 
This is really nice

* Use in BentoRock : I want to use this to create vegetable trading cards. It's nice! Pieces together the text, etc. into 
* Possibly just redoing the entire share social button so that the kids can save the image and or tweet from the same button?


# Branch 3

Imported Social Framework. Since this is a library I'm not going to be making changes to, I can import them inside the precompiled headers file
FunFacts-Mine-Prefix.pch 


                #ifdef __OBJC__
                    #import <UIKit/UIKit.h>
                    #import <Foundation/Foundation.h>
                    #import <Social/Social.h>
                #endif

Enumerator Declarations
Remember that I added tags to the social networking buttons

                // add an enumerator declaration
                // enumerator is used so you can easily check for tags of the buttons without having to use numbers that may not make much sense or provide clarity as to which button you're working with
                typedef enum SocialButtonTags
                {
                    SocialButtonTagFacebook,
                    SocialButtonTagSinaWeibo,
                    SocialButtonTagTwitter
                } SocialButtonTags;

# Branch 1- Basic User Interface

## Shaking (from UIResponder)
In order for the view controller to detect motions + gestures, it needs to tell teh app that it can become the first responder, and then actually become the first responder when it enters the foreground.

## Lazy Loading (p 766)
A good practice is to "lazy load" whatever you need into memroy. That just means not creating instances of objects or loading items into memory unti they are required. (not an ironclad law). Creating a custom getter for authorsArray (which links to the plist)

## Use Define Statements for Strings

Use #define statements for strings when accessing contents of a dictionary by key. The advantage of using a defined key is that you can easily change it once, and immediately have it updated wherever it's used.

