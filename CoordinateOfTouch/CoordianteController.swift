//
//  ViewController.swift
//  CoordinateOfTouch
//
//  Created by macbook pro on 03/10/18.
//  Copyright © 2018 Omni-Bridge. All rights reserved.
//

import UIKit

class CoordianteController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /// User create outer circle with center point as well as coordinate labels
    ///
    /// - Parameters:
    ///   - x: x point
    ///   - y: y point
    func createCircleWithCoordinateLabel(_ x: Double , _ y: Double) {
        // Used to create outer circle
        let outerCirclePath = UIBezierPath(arcCenter: CGPoint(x: x,y: y), radius: CGFloat(20), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        let outerShapeLayer = CAShapeLayer()
        outerShapeLayer.path = outerCirclePath.cgPath
        outerShapeLayer.fillColor = UIColor.clear.cgColor
        outerShapeLayer.strokeColor = UIColor.purple.cgColor
        outerShapeLayer.lineWidth = 1.0
        view.layer.addSublayer(outerShapeLayer)
        
        // Used to create center of circle where exaclty touch began
        let centerCirclePath = UIBezierPath(arcCenter: CGPoint(x: x,y: y), radius: CGFloat(1), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        let centerShapeLayer = CAShapeLayer()
        centerShapeLayer.path = centerCirclePath.cgPath
        centerShapeLayer.fillColor = UIColor.red.cgColor
        centerShapeLayer.strokeColor = UIColor.red.cgColor
        centerShapeLayer.lineWidth = 1.5
        view.layer.addSublayer(centerShapeLayer)
        
        // Used to create label x coordinate
        let lblForX = UILabel(frame: CGRect(x: x - 20, y: y - 8, width: 40, height: 8))
        lblForX.text = "X: \(Double(round(10*x)/10))"
        lblForX.textAlignment = .center
        lblForX.font = UIFont.systemFont(ofSize: 8)
        view.addSubview(lblForX)
        
        // Used to create label x coordinate
        let lblForY = UILabel(frame: CGRect(x: x - 20, y: y + 2, width: 40, height: 8))
        lblForY.text = "Y: \(Double(round(10*y)/10))"
        lblForY.textAlignment = .center
        lblForY.font = UIFont.systemFont(ofSize: 8)
        view.addSubview(lblForY)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            self.createCircleWithCoordinateLabel(Double(position.x), Double(position.y))
            print("touchesBegan",position)
        }
    }

}

