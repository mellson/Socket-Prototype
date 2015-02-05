//
//  AppDelegate.swift
//  Socket-Prototype
//
//  Created by Anders Bech Mellson on 05/02/15.
//  Copyright (c) 2015 dk.mellson. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        let st = SocketTest()
        st.startServer()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

