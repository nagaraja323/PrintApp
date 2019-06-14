//
//  APIManager.swift
//  PrintApp
//
//  Created by Ghantasala Nagaraja on 10/06/19.
//  Copyright © 2019 Ghantasala Nagaraja. All rights reserved.
//

import Cocoa

class APIManager: NSObject {

    static let apiManager = APIManager()
    private override init() {}
    
// fetch pdf file from url
    func downloadPdf() {
        
        // create directory path
        let documentsUrl:URL =  (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first)!
        let destinationFileUrl = documentsUrl.appendingPathComponent("downloadedFile.pdf")
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url: URL(string: "http://www.africau.edu/images/default/sample.pdf")!)
        
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                // Success
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Success: \(statusCode)")
                }
                
                do {
                    // write to directory path
                    try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
                } catch (let writeError) {
                    print("error writing file \(writeError) ")
                }
                
                // call notification to show pdf in printer
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showPdf"), object: nil)
                
                
            } else {
                print("Failure: %@", error!.localizedDescription)
            }
        }
        task.resume()
    }
}
