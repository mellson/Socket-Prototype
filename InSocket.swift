//
//  InSocket.swift
//  Socket-Prototype
//
//  Created by Anders Bech Mellson on 05/02/15.
//  Copyright (c) 2015 dk.mellson. All rights reserved.
//

import Foundation

class InSocket: NSObject, GCDAsyncUdpSocketDelegate {
    let IP = "localhost"
    let PORT:UInt16 = 5556
    var socket:GCDAsyncUdpSocket!
    
    override init(){
        super.init()
        setupConnection()
    }
    
    func setupConnection(){
        var error : NSError?
        socket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        socket.bindToPort(PORT, error: &error)
        socket.enableBroadcast(true, error: &error)
        socket.joinMulticastGroup(IP, error: &error)
        socket.beginReceiving(&error)
        println("Server Started")
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didReceiveData data: NSData!, fromAddress address: NSData!, withFilterContext filterContext: AnyObject!) {
        let receiveTime = mach_absolute_time()
        let strData = data.subdataWithRange(NSMakeRange(0, data.length))
        let msg = NSString(data: strData, encoding: NSUTF8StringEncoding)
        if let clientTime = msg {
            println("Client: \(clientTime), Received: \(receiveTime)");
        }
    }
}