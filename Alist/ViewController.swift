//
//  ViewController.swift
//  Alist
//
//  Created by Thanapat Sorralump on 1/7/17.
//  Copyright © 2017 Thanapat Sorralump. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startBtn.layer.cornerRadius = 8

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

