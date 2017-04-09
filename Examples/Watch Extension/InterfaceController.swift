//
//  InterfaceController.swift
//  ExampleWatch Extension
//
//  Created by Cem Olcay on 08/04/2017.
//  Copyright © 2017 cemolcay. All rights reserved.
//

import WatchKit
import Foundation
import ImageSequance

class InterfaceController: WKInterfaceController {
  @IBOutlet weak var interfaceImage: WKInterfaceImage?

  override func willActivate() {
    super.willActivate()
    let imageSequance = ImageSequance(
      name: "gun_",
      sequance: Range<Int>(0...7))
    imageSequance.repeatCount = 0
    interfaceImage?.play(sequance: imageSequance)
  }
}
