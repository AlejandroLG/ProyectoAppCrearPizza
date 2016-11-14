//
//  FirstStageViewController.swift
//  Pizza4U
//
//  Created by Alejandro on 11/13/16.
//  Copyright © 2016 soltek. All rights reserved.
//

import UIKit

class FirstStageViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var labelSmall: UILabel!
    @IBOutlet weak var labelMedium: UILabel!
    @IBOutlet weak var labelBig: UILabel!
    @IBOutlet weak var switchOptionSmall: UISwitch!
    @IBOutlet weak var switchOptionMedium: UISwitch!
    @IBOutlet weak var switchOptionBig: UISwitch!
    
    // MARK: Variables
    var currentPizza: Pizza!

    // MARK: - Functionality
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        currentPizza = Pizza()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    @IBAction func changedSmallSwitch(_ sender: UISwitch) {
        if sender.isOn {
            switchOptionBig.setOn(false, animated: true)
            switchOptionMedium.setOn(false, animated: true)
        }
        currentPizza.size = labelSmall.text
    }
    
    @IBAction func changedMediumSwitch(_ sender: UISwitch) {
        if sender.isOn {
            switchOptionSmall.setOn(false, animated: true)
            switchOptionBig.setOn(false, animated: true)
        }
        currentPizza.size = labelMedium.text
    }
    
    @IBAction func changedBigSwitch(_ sender: UISwitch) {
        if sender.isOn {
            switchOptionSmall.setOn(false, animated: true)
            switchOptionMedium.setOn(false, animated: true)
        }
        currentPizza.size = labelBig.text
    }
    
    @IBAction func continueAction(_ sender: UIButton) {
        if switchOptionSmall.isOn || switchOptionMedium.isOn || switchOptionBig.isOn {
            self.performSegue(withIdentifier: "size-dough", sender: self)
        }
        else {
            let erroAlert = UIAlertController.init(title: "Sorry :(", message: "please select the size of your pizza", preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "Ok", style: .cancel, handler: nil)
            erroAlert.addAction(okAction)
            self.present(erroAlert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let secondStage = segue.destination as! SecondStageViewController
        secondStage.currentPizza = currentPizza
    }
}
