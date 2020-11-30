//
//  ViewController.swift
//  FMD
//
//  Created by ali on 10/30/20.
//

import UIKit
import WebKit

class WebviewViewController: UIViewController {
    
    @IBOutlet weak var vwWebView: UIView!
    
    var url: String = ""
    var port: String = ""
    var IP: String = ""
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        url = "http://\(IP):\(port)"
        setupWebView(url: url)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    func setupWebView(url: String){
        showLoading(view: self.view, backgroundColor: UIColor.lightGray.withAlphaComponent(0.5))
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: vwWebView.frame, configuration: webConfiguration)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        if let url = URL(string: url){
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
            
            vwWebView.addSubview(webView)
            vwWebView.constrainToEdges(webView)
            
        }
    }
    
    
    func showLoading(view: UIView? = nil, backgroundColor: UIColor = .white) {
        var containerView = UIView()
        if let notNilView = view{
            containerView = notNilView
        } else {
            containerView = self.view
        }
        
        let backgroundView = UIView(frame: containerView.frame)
        //        backgroundView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.accessibilityIdentifier = "loadingView"
        
        let activityView = UIActivityIndicatorView(style: .large)
        activityView.startAnimating()
        activityView.color = .red
        //        activityView.setupAnimation()
        //        activityView.dropNormalShadow()
        //
        backgroundView.addSubview(activityView)
        backgroundView.constrainCentered(activityView, equalSize: false)
        
        containerView.addSubview(backgroundView)
        containerView.constrainCentered(backgroundView, equalSize: true)
    }
    
    func hideLoading(view: UIView? = nil) {
        var loadingView = UIView()
        if let view = view {
            loadingView = view
        }else{
            loadingView = self.view
        }
        for each in loadingView.allSubViews {
            if each.accessibilityIdentifier == "loadingView" {
                each.removeFromSuperview()
            }
        }
    }
    
    
}


extension WebviewViewController: WKUIDelegate, WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        hideLoading()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        hideLoading()
    }
}
