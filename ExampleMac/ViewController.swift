//
//  ViewController.swift
//  ExampleMac
//
//  Created by Cem Olcay on 08/04/2017.
//  Copyright © 2017 cemolcay. All rights reserved.
//

import Cocoa
import ImageSequance

class ViewController: NSViewController {
  @IBOutlet weak var exampleImageView: NSImageView?

  override func viewDidLoad() {
    super.viewDidLoad()
    let imageSequance = ImageSequance(
      name: "gun_",
      sequance: Range<Int>(0...7))
    imageSequance.repeatCount = 0
    exampleImageView?.play(sequance: imageSequance)
  }
}
