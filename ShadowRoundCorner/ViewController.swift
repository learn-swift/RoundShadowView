//
//  ViewController.swift
//  ShadowRoundCorner
//
//  Created by Duc on 1/13/19.
//  Copyright © 2019 Wits Mobility. All rights reserved.
//

import UIKit

extension UIView {
    var useAutolayout: Bool {
        set {
            translatesAutoresizingMaskIntoConstraints = !useAutolayout
        }

        get {
            return !translatesAutoresizingMaskIntoConstraints
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var customView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
    }

    func addViews() {
        let frame = customView.frame
        let myView = RoundShadowView(frame: CGRect(origin: CGPoint(x: frame.minX,
                                                                   y: view.bounds.height - frame.size.height - 32),
                                                   size: frame.size))
        myView.useAutolayout = true
        view.addSubview(myView)
    }
}

