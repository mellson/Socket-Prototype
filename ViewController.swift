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
    
    func getUptimeInMilliseconds() -> Int {
        let info = mach_timebase_info
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func upTime() -> UInt64 {
        let now: UInt64 = mach_absolute_time()
        var info: mach_timebase_info = mach_timebase_info(numer: 1, denom: 1)
        mach_timebase_info(&info)
        return (now * UInt64(info.numer) / UInt64(info.denom))
    }

    @IBAction func startServer(sender: NSButton) {
        inSocket = InSocket()
    }

    @IBAction func startClient(sender: NSButton) {
        outSocket = OutSocket()
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }
    
    func update() {
        outSocket.send("\(upTime())")
    }
}

