//
//  HTTPServer.swift
//  cube-timer
//
//  Created by Anshul Ahuja on 15/05/19.
//  Copyright © 2019 Anshul Ahuja. All rights reserved.
//

import Foundation
import GCDWebServer

func init_web_server() {
    
    let webServer = GCDWebServer()
    
    webServer.addDefaultHandler(forMethod: "GET", request: GCDWebServerRequest.self, processBlock: {request in
        return GCDWebServerDataResponse(html:"<html><body><p>Hello World</p></body></html>")
        
    })
    
    webServer.start(withPort: 8080, bonjourName: "GCD Web Server")
    
    print("Visit \(String(describing: webServer.serverURL)) in your web browser")
}
