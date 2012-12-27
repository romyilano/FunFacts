# Fun Facts

Social Frameworks tutorial from RayWenderlich.com - with many learnings. Going to resuse this in Bento Rock. Thank you teachers!


# Branch 3 - Button Up and Get Social

Start - p 770
Add Social Framework Into Your Project.


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

