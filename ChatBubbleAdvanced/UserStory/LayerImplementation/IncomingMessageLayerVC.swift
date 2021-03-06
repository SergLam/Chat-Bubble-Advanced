//
//  IncomingMessageLayerVC.swift
//  ChatBubbleAdvanced
//
//  Created by Serg Liamthev on 3/10/18.
//  Copyright © 2018 Serg Liamthev. All rights reserved.
//

import UIKit

final class IncomingMessageLayerVC: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showIncomingMessageLayer()
    }
    
    // MARK: - Custom view implementation
    func showIncomingMessageView() {
        let width: CGFloat = 0.66 * view.frame.width
        let height: CGFloat = width / 0.75
        
        let maskView = BubbleView()
        maskView.isIncoming = true
        maskView.backgroundColor = .clear
        maskView.frame.size = CGSize(width: width, height: height)
        
        let imageView = UIImageView(image: UIImage(named: "alpaca"))
        imageView.frame.size = CGSize(width: width, height: height)
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.mask = maskView
        
        view.addSubview(imageView)
    }
    
    func showOutgoingMessageView(text: String) {
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
    
    // MARK: - Layers implementation
    func showIncomingMessageLayer() {
        let width: CGFloat = 0.66 * view.frame.width
        let height: CGFloat = width / 0.75
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 22, y: height))
        bezierPath.addLine(to: CGPoint(x: width - 17, y: height))
        bezierPath.addCurve(to: CGPoint(x: width, y: height - 17), controlPoint1: CGPoint(x: width - 7.61, y: height), controlPoint2: CGPoint(x: width, y: height - 7.61))
        bezierPath.addLine(to: CGPoint(x: width, y: 17))
        bezierPath.addCurve(to: CGPoint(x: width - 17, y: 0), controlPoint1: CGPoint(x: width, y: 7.61), controlPoint2: CGPoint(x: width - 7.61, y: 0))
        bezierPath.addLine(to: CGPoint(x: 21, y: 0))
        bezierPath.addCurve(to: CGPoint(x: 4, y: 17), controlPoint1: CGPoint(x: 11.61, y: 0), controlPoint2: CGPoint(x: 4, y: 7.61))
        bezierPath.addLine(to: CGPoint(x: 4, y: height - 11))
        bezierPath.addCurve(to: CGPoint(x: 0, y: height), controlPoint1: CGPoint(x: 4, y: height - 1), controlPoint2: CGPoint(x: 0, y: height))
        bezierPath.addLine(to: CGPoint(x: -0.05, y: height - 0.01))
        bezierPath.addCurve(to: CGPoint(x: 11.04, y: height - 4.04), controlPoint1: CGPoint(x: 4.07, y: height + 0.43), controlPoint2: CGPoint(x: 8.16, y: height - 1.06))
        bezierPath.addCurve(to: CGPoint(x: 22, y: height), controlPoint1: CGPoint(x: 16, y: height), controlPoint2: CGPoint(x: 19, y: height))
        bezierPath.close()
        
        let incomingMessageLayer = CAShapeLayer()
        incomingMessageLayer.path = bezierPath.cgPath
        incomingMessageLayer.frame = CGRect(x: 0,
                                            y: 0,
                                            width: width,
                                            height: height)
        
        let imageView = UIImageView(image: UIImage(named: "alpaca"))
        imageView.frame.size = CGSize(width: width, height: height)
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.mask = incomingMessageLayer
        
        view.addSubview(imageView)
    }
    
}

