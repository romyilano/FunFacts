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
