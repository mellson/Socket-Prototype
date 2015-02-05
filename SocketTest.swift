//
//  SocketTest.swift
//  Socket-Prototype
//
//  Created by Anders Bech Mellson on 05/02/15.
//  Copyright (c) 2015 dk.mellson. All rights reserved.
//

import Foundation

class SocketTest : NSObject, GCDAsyncSocketDelegate {
    func startServer() {
        let socketQueue = dispatch_get_main_queue() //dispatch_queue_create("socketQueue", nil)
        let listenSocket = GCDAsyncSocket(delegate: self, delegateQueue: socketQueue)
        var error: NSError?
        let port: UInt16 = 7001
        
        let client = true
        
        if client {
            listenSocket.connectToHost("localhost", onPort: port, error: &error)
        } else { // server
            listenSocket.acceptOnPort(port, error: &error)
        }
        if let err = error {
            println(err.description)
        }
    }
    
    func socket(socket: GCDAsyncSocket, didAcceptNewSocket newSocket:GCDAsyncSocket) {
        let welcomeMsg: NSString = "Welcome to the AsyncSocket Echo Server\r\n"
        let welcomeData = welcomeMsg.dataUsingEncoding(NSUTF8StringEncoding)
        socket.writeData(welcomeData!, withTimeout: -1, tag: 0)
        println("wrote data")
    }
    
    func socket(socket: GCDAsyncSocket, didConnectToHost host:String, port p:UInt16) {
        println("didConnectToHost")
    }
    
    func socket(socket: GCDAsyncSocket, didReadData data:NSData, withTag tag:Int32) {
        let strData = data.subdataWithRange(NSMakeRange(0, data.length-2))
        let msg = NSString(data: strData, encoding: NSUTF8StringEncoding)
        println(msg)
    }
}