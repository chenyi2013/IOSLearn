//
//  ViewController.swift
//  WebViewDemo
//
//  Created by kevin chen on 2019/12/12.
//  Copyright © 2019 kevin chen. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {
    
    var webWiew:WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let screen = UIScreen.main.bounds
        
        let buttonBarWidth:CGFloat = 316
        let buttonBar = UIView(frame: CGRect(x:(screen.size.width-buttonBarWidth)/2,y:50,width: buttonBarWidth,height:30))
        self.view.addSubview(buttonBar)
        
        //添加loadHtmlString
        let buttonLoadHTMLString = UIButton(type:UIButton.ButtonType.system)
        buttonLoadHTMLString.setTitle("LoadHTMLString", for: UIControl.State.normal)
        buttonLoadHTMLString.frame = CGRect(x:0,y:10,width: 117,height: 30)
        buttonLoadHTMLString.addTarget(self, action: #selector(testLoadHTML(_:)), for: .touchUpInside)
        buttonBar.addSubview(buttonLoadHTMLString)
        
        let buttonLoadData = UIButton(type: UIButton.ButtonType.system)
        buttonLoadData.setTitle("LoadData", for: UIControl.State.normal)
        buttonLoadData.frame = CGRect(x:137,y:10,width: 67,height: 30)
          buttonLoadHTMLString.addTarget(self, action: #selector(testLoadData(_:)), for: .touchUpInside)
        buttonBar.addSubview(buttonLoadData)
        
        
        let buttonLoadRequest = UIButton(type: UIButton.ButtonType.system)
        buttonLoadRequest.setTitle("LoadRequest", for: UIControl.State.normal)
        buttonLoadRequest.frame = CGRect(x:224,y:10,width: 67,height: 30)
        buttonLoadRequest.addTarget(self, action: #selector(testLoadRequest(_:)), for: .touchUpInside)
        
        buttonBar.addSubview(buttonLoadRequest)
        
        self.webWiew = WKWebView(frame: CGRect(x: 0, y: 90, width: screen.size.width, height: screen.size.height-80))
        self.view.addSubview(self.webWiew)
        
     
    }
    
    @objc func testLoadHTML(_ sender:AnyObject) {
        
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let bundleUrl = URL(fileURLWithPath: Bundle.main.bundlePath)
        
        do {
            let html = try NSString(contentsOfFile: htmlPath!, encoding: String.Encoding.utf8.rawValue)
            self.webWiew.loadHTMLString(html as String, baseURL: bundleUrl)
            
        } catch let err as NSError {
            NSLog("加载失败 error :  %@", err.localizedDescription)
        }
        
    }
    
    @objc func testLoadData(_ sender:AnyObject)  {
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let bundleUrl = URL(fileURLWithPath: Bundle.main.bundlePath)
        let htmlData = try? Data(contentsOf: URL(fileURLWithPath: htmlPath!))
        
        self.webWiew.load(htmlData!, mimeType: "text/html", characterEncodingName: "UTF-8", baseURL: bundleUrl)
    }

    @objc func testLoadRequest(_ sender:Any)  {
        let url = NSURL(string: "https://www.baidu.com")
        let request = NSURLRequest(url: url! as URL)
        self.webWiew.load(request as URLRequest)
        self.webWiew.navigationDelegate = self
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("开始加载")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("内容开始返回")
    }

    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("加载完成")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("加载失败error: ",error.localizedDescription)
    }
}

