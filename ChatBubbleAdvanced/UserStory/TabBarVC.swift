//
//  TabBarVC.swift
//  ChatBubbleAdvanced
//
//  Created by Serg Liamthev on 21.05.2020.
//  Copyright © 2020 Serg Liamthev. All rights reserved.
//

import UIKit

final class TabBarVC: UITabBarController {
    
    private var navigationControllers: [UINavigationController] = []
    
    private let viewIncomingVC: IncomingMessageViewVC = IncomingMessageViewVC()
    private let viewOutgoingVC: OutgoingMessageViewVC = OutgoingMessageViewVC()
    
    private let layerIncomingVC: IncomingMessageLayerVC = IncomingMessageLayerVC()
    private let layerOutgoingVC: OutgoingMessageLayerVC = OutgoingMessageLayerVC()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private functions
    private func configureUI() {
        
        view.backgroundColor = .white
        configureTabBar()
    }
    
    private func configureTabBar() {
        
        viewIncomingVC.navigationItem.title = "Incoming message view"
        viewIncomingVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        viewOutgoingVC.navigationItem.title = "Outgoing message view"
        viewOutgoingVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        layerIncomingVC.navigationItem.title = "Incoming message layer"
        layerIncomingVC.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 2)
        
        layerOutgoingVC.navigationItem.title = "Outgoing message layer"
        layerOutgoingVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 3)

        let controllers = [viewIncomingVC, layerIncomingVC, viewOutgoingVC, layerOutgoingVC]
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = .white
        
        let navigationControllers: [UINavigationController] = controllers.map{
            let navVC: UINavigationController = UINavigationController(rootViewController: $0)
            navVC.setNavigationBarHidden(false, animated: false)
            return navVC
        }
        self.navigationControllers = navigationControllers
        
        self.viewControllers = navigationControllers
        self.selectedIndex = 0
    }
    
}
