# Voiceover Accessibility + Modal Presentation and View Hierarchy

I noticed that when building an app for voiceover accessibility, if you use modal presentation styles like `overFullScreen`, `overCurrentContext` & `custom` it's possible for voiceover to highlight elements on view controllers behind the current one. This is bad and kind of seems like a bug on Apple's part.

This is a sample app that I used to experiment and I finally came across `accessibilityActivate()`, which "fixes" the problem described above. Below are a few steps to see & fix the problem I'm talking about.

1. Download the project
2. Open `ViewController.swift`
3. Comment out `accessibilityActivate()` inside `viewDidLoad()`
4. Make sure voiceover on your device is turned OFF
5. Run the app (you'll probably need to change the signing certificate setting :)
6. Tap the `Present Modally - Over Full Screen` or `Present Modally - Over Current Context` buttons a couple times (building up a view hierarchy)
7. Turn on voiceover and navigate around. Notice how there are several instances of the label and each button, as voiceover is reaching into view controllers behind the current one. This is bad.

Now for the fix

1. Make sure to un-comment `accessibilityActivate()` inside `ViewController.swift`'s `viewDidLoad()`
2. Turn OFF voiceover on your device
3. Run the app
4. Tap `Present Modally - Over Full Screen` or `Present Modally - Over Current Context` buttons a few more times
5. Turn on voiceover and navigate around. The problem is fixed!

So what's going on...?
If you paid close attention you probably noticed I said to turn off voiceover before running the app. If voiceover was on when the app opened, then turned off, you wouldn't see the problem I described. If voiceover was on the whole time, you'd also fail to see the bug. Voiceover appears to activate some special methods/listeners that do something special. Something that `accessibilityActivate()` also does (probably as a side effect of attempting to use accessibility). It's very probably that a user will open an app with voiceover off, then turn it on at some point. So if your app has `overFullScreen`, `overCurrentContext`, or even `custom` transitions, things will get really jumbled up in voiceover. For now (as of 8/15/18) you can use this fix to prevent the problem. 

Cheers!

Trevor
