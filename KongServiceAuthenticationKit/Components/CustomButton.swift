//
//  CustomButton.swift
//  KongServiceAuthenticationKit
//
//  Created by leejinhae on 2020/09/07.
//  Copyright © 2020 KONGTech. All rights reserved.
//
#if os(iOS)

import UIKit

@available(iOS 9.0, *)
class CustomButton:UIControl{
    required init?(coder: NSCoder) { fatalError() }
    
    let imgLayer = CAShapeLayer()
    
    init(){
        super.init(frame:.zero)
        layer.addSublayer(imgLayer)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        imgLayer.strokeColor = traitCollection.isDarkMode ? UIColor.white.cgColor : UIColor.black.cgColor
    }
    
    
    override func draw(_ rect: CGRect) {
        imgLayer.frame = rect
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 14, y: 14))
        path.addLine(to: CGPoint(x: rect.width - 14, y: rect.height - 14))
        path.move(to: CGPoint(x: rect.width - 14, y: 14))
        path.addLine(to: CGPoint(x: 14, y: rect.height - 14))
        
        imgLayer.path = path.cgPath
        
        imgLayer.strokeColor = traitCollection.isDarkMode ? UIColor.white.cgColor : UIColor.black.cgColor
        imgLayer.lineWidth = 3
        imgLayer.lineCap = .round
    }
    
    
}
#endif
