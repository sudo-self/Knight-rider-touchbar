
//
//  ViewController.swift
//  Knight Rider TouchBar
//
//  Created by Jesse Roper
//  Copyright © 2023 Jesse Roper All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var scannerCheckbox: NSButton!
    @IBOutlet weak var kittCar: NSImageView!
    let scannerSound = NSSound(named: "KITT_scanner")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.wantsLayer = true
        
        kittCar.image = NSImage(named: "kitt_car.gif")
        kittCar.frame = CGRect(x: 0, y: 0, width: 400, height: 300)
        kittCar.animates = true
        
        scannerSound?.loops = true
        isScannerChecked()
    }
    
    @IBAction func setScannerMusic(_ sender: Any) {
        isScannerChecked()
    }
    
    func isScannerChecked() {
        
        switch scannerCheckbox.state {
        case NSControl.StateValue.on:
            scannerCheckbox.title = "Scanner sound on"
            scannerSound?.play()
        default:
            scannerCheckbox.title = "Scanner sound off"
            scannerSound?.stop()
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            let bgColor: CGColor = NSColor(red: 0.988, green: 0.296, blue: 0.312, alpha: 1).cgColor
            self.view.layer?.backgroundColor = bgColor
        }
    }


}

