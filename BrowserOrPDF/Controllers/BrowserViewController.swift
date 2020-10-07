//
//  BrowserViewController.swift
//  BrowserOrPDF
//
//  Created by Denis on 11/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit
import WebKit

class BrowserViewController: UIViewController {
    
    
    
    var webView = WKWebView()
    var myToolBar = UIToolbar()
    var goBackButton = UIBarButtonItem()
    var goForwardButton = UIBarButtonItem()
    let activityIndicator = UIActivityIndicatorView()
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webViewSetUp()
        toolBarSetUp()
        activityIndicatorSetUp()
        
    }
}

//MARK: - Method
extension BrowserViewController {
    
    func webViewSetUp() {
        
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 50))

        webView.navigationDelegate = self
        
        if let googleUrl = URL(string: "https://www.google.com") {
            let request = URLRequest(url: googleUrl)
            webView.load(request)
        }
        
        self.view.addSubview(webView)

    }
    
    func toolBarSetUp() {
        myToolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.bounds.height - 50, width: self.view.bounds.width, height: 50))
        myToolBar.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        goBackButton = UIBarButtonItem.init(barButtonSystemItem: .rewind, target: self, action: #selector(goBackAction))
        let fixedSpace = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        goForwardButton = UIBarButtonItem.init(barButtonSystemItem: .fastForward, target: self, action: #selector(goForwardAction))
        let flexibalSpace = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let refreshButton = UIBarButtonItem.init(barButtonSystemItem: .refresh, target: self, action: #selector(refreshAction))
        
        myToolBar.setItems([goBackButton, fixedSpace, goForwardButton, flexibalSpace, refreshButton], animated: true)
        
        self.view.addSubview(myToolBar)
    }
    
    func activityIndicatorSetUp() {
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
    }
    
    func activityIsWorking(isAnimated: Bool, indicator: UIActivityIndicatorView) {
        if isAnimated {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = false
        } else {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        }
        
    }
}

//MARK: - Action
extension BrowserViewController {
    @objc func goBackAction() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    @objc func goForwardAction() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    @objc func refreshAction() {
        webView.reload()
    }
}

extension BrowserViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIsWorking(isAnimated: true, indicator: activityIndicator)
        goBackButton.isEnabled = false
        goForwardButton.isEnabled = false
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIsWorking(isAnimated: false, indicator: activityIndicator)

        if webView.canGoBack {
            goBackButton.isEnabled = true
        }
        if webView.canGoForward {
            goForwardButton.isEnabled = true
        }
    }
}
