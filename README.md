ImageSequance
===

Universal image sequance animation library for iOS, tvOS, macOS and watchOS.

Requirements
----

* Swift 3+
* iOS 8.0+
* tvOS 9.0+
* watchOS 2.0+
* macOS 10.9+

Install
----

```
use_frameworks!
pod 'ImageSequance'
```

Usage
----

* Setup your images sequance naming. For example if you have 10 images than your images should named like `frame-0` to `frame-9`.
* Craete a sequance with naming and sequance range or directly image array.
* Call `play(sequance:)` function on `UIImageView`, `NSImageView` or `WKInterfaceImage`.
* Call `stopAnimating()` function to stop animation
* You could also set `repeatCount` property on sequance. Set 0 for infinite repeat.
* And `duration` property to control sequance duration.

```
let imageSequance = ImageSequance(
  name: "frame-",
  sequance: 0...9) // Int array or 0, 1, ..., 9 syntax will also work.
imageSequance.repeatCount = 0 // infinite repeat
imageView.play(sequance: imageSequance)
```

