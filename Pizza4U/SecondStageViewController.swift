//
//  SecondStageViewController.swift
//  Pizza4U
//
//  Created by Alejandro on 11/13/16.
//  Copyright © 2016 soltek. All rights reserved.
//

import UIKit

class SecondStageViewController: UIViewController {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelThin: UILabel!
    @IBOutlet weak var labelCrunchy: UILabel!
    @IBOutlet weak var labelThick: UILabel!
    @IBOutlet weak var switchOptionThin: UISwitch!
    @IBOutlet weak var switchOptionCrunchy: UISwitch!
    @IBOutlet weak var switchOptionThick: UISwitch!
    
    var currentPizza: Pizza!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelTitle.adjustsFontSizeToFitWidth = true
        if currentPizza.dough != nil {
            if currentPizza.dough == "Thin" {
                switchOptionThin.setOn(true, animated: false)
            }
            else if currentPizza.dough == "Crunchy" {
                switchOptionCrunchy.setOn(true, animated: false)
            }
            else if currentPizza.dough == "Thick" {
                switchOptionThick.setOn(true, animated: false)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    @IBAction func changedThinSwitch(_ sender: UISwitch) {
        if sender.isOn {
            switchOptionCrunchy.setOn(false, animated: true)
            switchOptionThick.setOn(false, animated: true)
        }
        currentPizza.dough = labelThin.text
    }
    
    @IBAction func changedCrunchySwitch(_ sender: UISwitch) {
        if sender.isOn {
            switchOptionThin.setOn(false, animated: true)
            switchOptionThick.setOn(false, animated: true)
        }
        currentPizza.dough = labelCrunchy.text
    }
    
    @IBAction func changedThickSwitch(_ sender: UISwitch) {
        if sender.isOn {
            switchOptionThin.setOn(false, animated: true)
            switchOptionCrunchy.setOn(false, animated: true)
        }
        currentPizza.dough = labelThick.text
    }

    @IBAction func continueAction(_ sender: UIButton) {
        if switchOptionThin.isOn || switchOptionCrunchy.isOn || switchOptionThick.isOn {
            self.performSegue(withIdentifier: "dough-cheese", sender: self)
        }
        else {
            let erroAlert = UIAlertController.init(title: "Sorry :(", message: "please select the type of dough for your pizza", preferredStyle: .alert)
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
        let nextController = segue.destination as! ThirdStageViewController
        nextController.currentPizza = currentPizza
    }
}
