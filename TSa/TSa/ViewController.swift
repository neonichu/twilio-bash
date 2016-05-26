//
//  ViewController.swift
//  TSa
//
//  Created by Boris Bügling on 25/05/16.
//  Copyright © 2016 Boris Bügling. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var label: UILabel = {
        let label = UILabel(frame: self.view.bounds)
        label.font = UIFont.systemFontOfSize(200)
        label.textAlignment = .Center
        self.view.addSubview(label)
        return label
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.active), name: UIApplicationDidBecomeActiveNotification, object: nil)
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    func active() {
        if Int(arc4random_uniform(2)) == 0 {
            self.label.text = "👈"
        } else {
            self.label.text = "👉"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        active()
    }
}

