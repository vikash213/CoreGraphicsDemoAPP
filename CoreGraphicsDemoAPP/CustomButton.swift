//
//  CustomButton.swift
//  CoreGraphicsDemoAPP
//
//  Created by Appinventiv on 28/12/18.
//  Copyright © 2018 Vikash. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {

    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true
    
    private var bgColor: UIColor = .blue
    
    private struct Constants {
        static let plusLineWidth: CGFloat = 3.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
    func setBackground(color: UIColor) {
        self.bgColor = color
    }
    
    override func draw(_ rect: CGRect) {
       // let path = UIBezierPath(arcCenter: CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.width/2), radius: 30.0, startAngle: 30.0, endAngle: 30.0, clockwise: true)
        //let path1 = UIBezierPath(cgPath: CGPath(ellipseIn: rect, transform: UnsafePointer<CGAffineTransform>?.none))
        fillColor.setFill()
        let path = UIBezierPath(ovalIn: rect)
        //self.bgColor.setFill()
        path.fill()
       
        //set up the width and height variables
        //for the horizontal stroke
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        let halfPlusHeight = plusWidth / 2
        
        //create the path
        let plusPath = UIBezierPath()
        
        //set the path's line width to the height of the stroke
        plusPath.lineWidth = Constants.plusLineWidth
        
        //move the initial point of the path
        //to the start of the horizontal stroke
        //move the initial point of the path
        //to the start of the horizontal stroke
        plusPath.move(to: CGPoint(
            x: halfWidth - halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift))
        
        //add a point to the path at the end of the stroke
        plusPath.addLine(to: CGPoint(
            x: halfWidth + halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift))
        
        //set the stroke color
        UIColor.white.setStroke()
        
        //draw the stroke
        plusPath.stroke()
        
        if isAddButton {
            plusPath.move(to: CGPoint(
                x: halfWidth + Constants.halfPointShift,
                y: halfHeight - halfPlusHeight + Constants.halfPointShift))
            
            //add a point to the path at the end of the stroke
            plusPath.addLine(to: CGPoint(
                x: halfWidth + Constants.halfPointShift,
                y: halfHeight + halfPlusHeight + Constants.halfPointShift))
        }
      
        //set the stroke color
        UIColor.white.setStroke()
        plusPath.stroke()
    }
    
}
