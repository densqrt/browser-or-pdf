//
//  MainViewController.swift
//  BrowserOrPDF
//
//  Created by Denis on 11/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsCreate()
    }
}

//MARK: - Method
extension MainViewController {
    
    func buttonsCreate() {
        let browserButton = UIButton(frame: CGRect(x: 10, y: 80, width: self.view.bounds.width - 20, height: self.view.bounds.height / 2 - 80 ))
        browserButton.layer.cornerRadius = 30
        browserButton.setTitle("Browser", for: .normal)
        browserButton.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        browserButton.addTarget(self, action: #selector(openBrowser), for: .touchUpInside)
        self.view.addSubview(browserButton)
        
        let pdfButton = UIButton(frame: CGRect(x: 10, y: self.view.bounds.height / 2 + 40, width: self.view.bounds.width - 20, height: self.view.bounds.height / 2 - 80 ))
        pdfButton.layer.cornerRadius = 30
        pdfButton.setTitle("Open PDF", for: .normal)
        pdfButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        pdfButton.addTarget(self, action: #selector(openPDF), for: .touchUpInside)
        self.view.addSubview(pdfButton)
        
    }

}

//MARK: - Action
extension MainViewController {
    
    @objc func openBrowser() {
        let browser = BrowserViewController()
        navigationController?.pushViewController(browser, animated: true)
    }
    
    @objc func openPDF() {
        let pdf = PDFViewController()
        navigationController?.pushViewController(pdf, animated: true)
    }
}
