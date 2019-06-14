//
//  AppDelegate.swift
//  PrintApp
//
//  Created by Ghantasala Nagaraja on 10/06/19.
//  Copyright © 2019 Ghantasala Nagaraja. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func printPdfFile(_ sender: Any) {
        pdfUtility.displayPrinter()
    }
    
}

