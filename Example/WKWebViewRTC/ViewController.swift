//
//  ViewController.swift
//  WKWebViewRTC
//
//  Created by JustDoIt9 on 07/28/2020.
//  Copyright (c) 2020 JustDoIt9. All rights reserved.
//

import UIKit
import WebKit
import WKWebViewRTC
import WebRTC

class ViewController: UIViewController {

	@IBOutlet weak var webView: WKWebView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
        // Do any additional setup after loading the view, typically from a nib.
		WKWebViewRTC(wkwebview: webView, contentController: webView.configuration.userContentController)
        webView.load(URLRequest(url: URL(string: "https://mapp.test.schools.vn/")!))
//		webView.load(URLRequest(url: URL(string: "https://gruhn.github.io/vue-qrcode-reader/demos/DecodeAll.html")!))
        
    }
}

