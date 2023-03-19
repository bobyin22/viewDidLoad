//
//  SharpLmageView.swift
//  viewDidLoad
//
//  Created by 邱慧珊 on 2023/3/17.
//

import UIKit

class SharpLmageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //Mask遮罩把圖斜切
    override func layoutSubviews() {
       super.layoutSubviews()
        
        
       let path = UIBezierPath()
       path.move(to: CGPoint.zero)
       path.addLine(to: CGPoint(x: bounds.width, y: 0))
       path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
       path.addLine(to: CGPoint(x: 0, y: bounds.height * 0.8))
       path.close()
       let shapeLayer = CAShapeLayer()
       shapeLayer.path = path.cgPath
       layer.mask = shapeLayer
    }
    

}
