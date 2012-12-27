# Fun Facts

Social Frameworks tutorial from RayWenderlich.com - with many learnings. Going to resuse this in Bento Rock. Thank you teachers!



# Notes

## Shaking (from UIResponder)
In order for the view controller to detect motions + gestures, it needs to tell teh app that it can become the first responder, and then actually become the first responder when it enters the foreground.

## Lazy Loading (p 766)
A good practice is to "lazy load" whatever you need into memroy. That just means not creating instances of objects or loading items into memory unti they are required. (not an ironclad law). Creating a custom getter for authorsArray (which links to the plist)

## Use Define Statements for Strings

Use #define statements for strings when accessing contents of a dictionary by key. The advantage of using a defined key is that you can easily change it once, and immediately have it updated wherever it's used.

