//
//  PdfUtility.swift
//  PrintApp
//
//  Created by Ghantasala Nagaraja on 10/06/19.
//  Copyright © 2019 Ghantasala Nagaraja. All rights reserved.
//

import Cocoa
import Quartz

class PdfUtility: NSObject {
    static let pdfUtility = PdfUtility()
    private override init() {}

    func displayPrinter(){
        DispatchQueue.global(qos: .background).async {
            let printInfo = NSPrintInfo.shared
            let manager = FileManager.default
            do{
                let directoryURL = try manager.url(for: .documentDirectory, in:.userDomainMask, appropriateFor:nil, create:true)
                let docURL = NSURL(string:"downloadedFile.pdf", relativeTo:directoryURL)
                
                
                DispatchQueue.main.async{
                    let pdfDoc =  PDFDocument.init(url: docURL! as URL)
                    let page = CGRect(x: 0, y: 0, width: 595, height: 842) // A4
                    let pdfView : PDFView = PDFView.init(frame: page)
                    pdfView.document = pdfDoc
                    let operation: NSPrintOperation = NSPrintOperation(view: pdfView, printInfo: printInfo)
                    operation.printPanel.options.insert(NSPrintPanel.Options.showsPaperSize)
                    operation.printPanel.options.insert(NSPrintPanel.Options.showsOrientation)
                    
                    operation.run()
                }
            }catch{
                print("Unable to open print")
            }
            
            
        }
    }
}
