//
//  AppDelegate.swift
//  ChatBubbleAdvanced
//
//  Created by Serg Liamthev on 3/10/18.
//  Copyright © 2018 Serg Liamthev. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder {
    
    var window: UIWindow?
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override init() {
        super.init()
    }
    
    static var shared: AppDelegate {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            preconditionFailure("Unable to cast app delegate")
        }
        return delegate
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .portrait
    }
    
}

// MARK: - UIApplicationDelegate
extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

