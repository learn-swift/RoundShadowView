//
//  RoundShadowView.swift
//  ShadowRoundCorner
//
//  Created by Duc on 1/13/19.
//  Copyright © 2019 Wits Mobility. All rights reserved.
//

import UIKit

@IBDesignable
class RoundShadowView: UIView {

    private var shadowLayer: CAShapeLayer!

    @IBInspectable var cornerRadius: CGFloat = 6.0 {
        didSet {
            updateShadow()
        }
    }

    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet {
            updateShadow()
        }
    }

    @IBInspectable var shadowRadius: CGFloat = 4 {
        didSet {
            updateShadow()
        }
    }

    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            updateShadow()
        }
    }

    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet {
            updateShadow()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addShadowLayer()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addShadowLayer()
    }


    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        print(#function)
        addShadowLayer()
    }

    func updateShadow() {
        shadowLayer.removeFromSuperlayer()
        shadowLayer = nil
        addShadowLayer()
        setNeedsDisplay()
    }

    func addShadowLayer() {

        guard shadowLayer == nil else { return }
        shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = backgroundColor?.cgColor ?? UIColor.white.cgColor
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = shadowOffset
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = shadowRadius

        layer.insertSublayer(shadowLayer, at: 0)
    }

}
