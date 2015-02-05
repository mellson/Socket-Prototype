//
//  ViewController.swift
//  Socket-Prototype
//
//  Created by Anders Bech Mellson on 05/02/15.
//  Copyright (c) 2015 dk.mellson. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var inSocket : InSocket!
    var outSocket : OutSocket!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func startServer(sender: NSButton) {
        inSocket = InSocket()
    }

    @IBAction func startClient(sender: NSButton) {
        outSocket = OutSocket()
        outSocket.send("\(mach_absolute_time())")
//        while true {
//            
//            sleep(1)
//        }
    }
}

