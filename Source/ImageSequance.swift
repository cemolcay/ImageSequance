//
//  ImageSequance.swift
//  ImageSequance
//
//  Created by Cem Olcay on 08/04/2017.
//  Copyright © 2017 cemolcay. All rights reserved.
//

#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#elseif os(watchOS)
  import WatchKit
#endif

#if os(iOS) || os(tvOS)
  public typealias ISImage = UIImage
  public typealias ISImageView = UIImageView
#elseif os(OSX)
  public typealias ISImage = NSImage
  public typealias ISImageView = NSImageView
#elseif os(watchOS)
  public typealias ISImage = WKImage
  public typealias ISImageView = WKInterfaceImage
#endif

#if os(iOS) || os(tvOS)
  public extension UIImageView {
    public func play(sequance: ImageSequance) {
      stopAnimating()
      animationImages = sequance.images
      animationDuration = sequance.duration
      animationRepeatCount = sequance.repeatCount
      startAnimating()
    }
  }
#elseif os(OSX)
  public extension NSImageView {
    public func play(sequance: ImageSequance) {
      // Setup layer
      wantsLayer = true
      layer = CALayer()
      // Setup animation
      let animation = CAKeyframeAnimation(keyPath: "contents")
      animation.calculationMode = kCAAnimationDiscrete
      animation.values = sequance.images
      animation.duration = sequance.duration
      animation.repeatCount = sequance.repeatCount == 0 ? Float.infinity : Float(sequance.repeatCount)
      layer?.add(animation, forKey: imageSequanceAnimationKey())
    }

    public func stopAnimating() {
      layer?.removeAnimation(forKey: imageSequanceAnimationKey())
    }

    private func imageSequanceAnimationKey() -> String {
      return "com.imageSequance.animation"
    }
  }
#elseif os(watchOS)
  public extension WKImage {
    public convenience init(named: String) {
      self.init(imageName: named)
    }
  }

  public extension WKInterfaceImage {
    public func play(sequance: ImageSequance) {
      stopAnimating()
      setImageNamed(sequance.name)
      startAnimatingWithImages(
        in: sequance.range,
        duration: sequance.duration,
        repeatCount: sequance.repeatCount)
    }
  }
#endif

public class ImageSequance {
  /// All images of image sequance animation, in order.
  public var images: [ISImage]

  /// Duration of image sequance animation.
  public var duration: TimeInterval = 1

  /// 0 means repeat until stop. Defaults 1.
  public var repeatCount: Int = 1

  #if os(watchOS)
    /// Image sequance name.
    /// If we have a sequance "frame-0" to "frame-10" than it should be "frame-"
    public var name: String
    /// Image sequance number.
    /// If we have a sequance "frame-0" to "frame-10" than it should be NSRange(0...10)
    public var range: NSRange
  #endif

  #if !os(watchOS)
    public init(images: [ISImage]) {
      self.images = images
    }

    public convenience init(name: String, sequance: [Int]) {
      self.init(images: sequance.flatMap({ ISImage(named: "\(name)\($0)") }))
    }

    public convenience init(name: String, sequance: Int...) {
      self.init(name: name, sequance: sequance)
    }
  #endif

  public init(name: String, sequance: Range<Int>) {
    self.images = Array(sequance.lowerBound...sequance.upperBound)
      .flatMap({ ISImage(named: "\(name)\($0)") })

    #if os(watchOS)
      self.name = name
      self.range = NSRange(sequance)
    #endif
  }
}
