//
//  PDFViewController.swift
//  BrowserOrPDF
//
//  Created by Denis on 11/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit
import WebKit

class PDFViewController: UIViewController {

    var webView = WKWebView()
    
     //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
       
        webViewSetUp()
    }

}

//MARK: - Method
extension PDFViewController {
    func webViewSetUp() {
    
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        self.view.addSubview(webView)
        if let pdfUrl = Bundle.main.url(forResource: "CodeOrganization", withExtension: "pdf") {
            let request = URLRequest(url: pdfUrl)
            webView.load(request)
            webView.sizeToFit()
            
        }
        
    }
}
