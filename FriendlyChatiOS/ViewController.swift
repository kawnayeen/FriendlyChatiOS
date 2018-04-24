//
//  ViewController.swift
//  FriendlyChatiOS
//
//  Created by Kawnayeen on 18/4/18.
//  Copyright © 2018 Kawnayeen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseRemoteConfig

class ViewController: UIViewController {

    var remoteConfig : RemoteConfig?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureRemoteConfig()
        fetchConfig()
    }
    
    func configureRemoteConfig() {
        let remoteConfigSettings = RemoteConfigSettings(developerModeEnabled: true)
        remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig?.configSettings = remoteConfigSettings!
    }
    
    func fetchConfig() {
        remoteConfig?.fetch(completionHandler: { (status, error) in
            if status == .success {
                self.remoteConfig?.activateFetched()
                let friendlyMsgLength = self.remoteConfig?["friendly_msg_length"]
                print("config fetched: \(friendlyMsgLength!.numberValue!)")
            } else {
                print("config failed")
            }
        })
    }
}

