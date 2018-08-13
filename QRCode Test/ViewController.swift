//
//  ViewController.swift
//  QRCode Test
//
//  Created by Josh Jaslow on 3/8/18.
//  Copyright © 2018 Jaslow Enterprises. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var correctnessLevel = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func generateCode(_ sender: UIButton) {
        let str = textBox.text!
        let data = str.data(using: .ascii, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")!
        filter.setValue(data, forKey: "inputMessage")
        switch correctnessLevel {
        case 0:
            filter.setValue("L", forKey: "inputCorrectionLevel")
        case 1:
            filter.setValue("M", forKey: "inputCorrectionLevel")
        case 2:
            filter.setValue("Q", forKey: "inputCorrectionLevel")
        case 3:
            filter.setValue("H", forKey: "inputCorrectionLevel")
        default:
            filter.setValue("L", forKey: "inputCorrectionLevel")
        }
        let transform = CGAffineTransform(scaleX: 50, y: 50)
        imageView.image = UIImage(ciImage: filter.outputImage!.transformed(by: transform))
    }

    @IBAction func changeLevel(_ sender: UISegmentedControl) {
        correctnessLevel = sender.selectedSegmentIndex
    }
}

