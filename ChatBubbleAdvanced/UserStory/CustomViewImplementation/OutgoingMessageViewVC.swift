//
//  OutgoingMessageViewVC.swift
//  ChatBubbleAdvanced
//
//  Created by Serg Liamthev on 21.05.2020.
//  Copyright © 2020 Serg Liamtsev. All rights reserved.
//

import UIKit

final class OutgoingMessageViewVC: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showOutgoingMessageView(text: "An arbitrary text which we use to demonstrate how our label sizes' calculation works.")
    }
    
    // MARK: - Private functions
    private func showOutgoingMessageView(text: String) {
        let label =  UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.text = text
        
        let constraintRect = CGSize(width: 0.66 * view.frame.width,
                                    height: .greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [.font: label.font],
                                            context: nil)
        label.frame.size = CGSize(width: ceil(boundingBox.width),
                                  height: ceil(boundingBox.height))
        
        let bubbleSize = CGSize(width: label.frame.width + 28,
                                     height: label.frame.height + 20)
        
        let bubbleView = BubbleView()
        bubbleView.frame.size = bubbleSize
        bubbleView.backgroundColor = .clear
        bubbleView.center = view.center
        view.addSubview(bubbleView)
        
        label.center = view.center
        view.addSubview(label)
    }
    
}
