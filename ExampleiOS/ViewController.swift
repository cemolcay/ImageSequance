//
//  ViewController.swift
//  ExampleiOS
//
//  Created by Cem Olcay on 08/04/2017.
//  Copyright © 2017 cemolcay. All rights reserved.
//

import UIKit
import ImageSequance

class ViewController: UIViewController {
  @IBOutlet weak var imageView: UIImageView?
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let imageSequance = ImageSequance(
      name: "gun_",
      sequance: Range<Int>(0...7))
    imageSequance.repeatCount = 0
    imageView?.play(sequance: imageSequance)
  }
}

