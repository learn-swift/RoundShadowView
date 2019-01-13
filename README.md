# RoundShadowView
Easy way to create the Round Shadow View

Override layoutSubviews to add a new layer using a path with a roundedRect and cornerRadius
```
override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = cornerRadius
    addShadowLayer()
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
```
<!--- ![](Simulator Screen Shot - iPhone X - 2019-01-13 at 11.15.50.png) --->

<img src="Simulator%20Screen%20Shot%20-%20iPhone%20X%20-%202019-01-13%20at%2011.15.50.png" alt="" width="300">
