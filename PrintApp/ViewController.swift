//
//  ViewController.swift
//  PrintApp
//
//  Created by Ghantasala Nagaraja on 10/06/19.
//  Copyright © 2019 Ghantasala Nagaraja. All rights reserved.
//

import Cocoa
import Quartz

class ViewController: NSViewController {
    
    @IBOutlet weak var printBtn: NSButton!
    
    let apiManager = APIManager.apiManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register notification
        registerNotification()
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func printBtnClicked(_ sender: Any) {
        print("tapped Print")
        apiManager.downloadPdf()
    }
    
    @objc open func showPDF() {
        pdfUtility.displayPrinter()
    }

    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(showPDF), name: NSNotification.Name(rawValue: "showPdf"), object: nil)
    }

    func unRegisterNotification(){
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "showPdf"), object: nil)
    }

    deinit {
        // Un register notification
        unRegisterNotification()
    }

}

