MD Extensions
=================

This is a collection of useful utility extension for different common things we work with.

# Use #
To use this in your own code please install it via cocoapods.
In your pod file please add
```
pod 'MD-Extensions'
```
Then in the root of you project run the following
```pod install```

Then in your code you can import it with ```import MDExtensions```

# Project Organization #
The project has nearly full test coverage. If any work is done, or new features added, please ensure all unit tests pass and add new unit tests for any additional functionality

# Overview
The project includes the following Extensions. Please consult each file for full documentation

## UIColor
- The main things added here are being able to work with raw HEX strings (we get these alot from design as they work with CSS primarily)

You can create colors from a given HEX string. e.g. ```UIColor(hexValue: "#AAAAAA")``` will create a gray color

Optionally, you can pass two additional HEX characters on the end of the string for also configuring an opacity value (it divides the hex by FF to generate the alpha value). e.g. ```UIColor(hexValue: "FFFFFF00") will make a clear color.

## Date (formerly NSDate)
- Added a way to create Date objects from a Markit Digital MSDate number.

## DateFormatter (formerly NSDateFormatter)
- The main thing here is that creating formatted dates, or dates from pre formatted date strings will handle the dirty work of statically caching DateFormatter objects for you. Just call the method with the arguments you want and dont worry about anything else.

## CharacterSet (formerly NSCharacterSet)
- Added a method to printall characters that a given CharacterSet currently is holding.

## String
- Due to the nature of String in Swift 3, you cannot easily access specific characters at an integer index. Long story short, you need to use an "Index" object to find what you want. This extension adds methods that will handle that for you if all you want to do is search for the 5th character in the string 'Alphabet'.

## Collection
- Added an override to the subscript operator for array type collections that can return an optional in the event of an out of bounds index. it uses the syntax ```let myOptional = collection[safe: 42]```.