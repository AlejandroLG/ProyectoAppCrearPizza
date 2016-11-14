//
//  FirstViewController.swift
//  Pizza4U
//
//  Created by Alejandro on 11/13/16.
//  Copyright © 2016 soltek. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var labelTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labelTitle.adjustsFontSizeToFitWidth = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

