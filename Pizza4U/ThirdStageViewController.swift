//
//  ThirdStageViewController.swift
//  Pizza4U
//
//  Created by Alejandro on 11/13/16.
//  Copyright © 2016 soltek. All rights reserved.
//

import UIKit

class ThirdStageViewController: UIViewController {
    @IBOutlet weak var labelMozzarella: UILabel!
    @IBOutlet weak var labelCheddar: UILabel!
    @IBOutlet weak var labelParmesan: UILabel!
    @IBOutlet weak var labelNoCheese: UILabel!
    @IBOutlet weak var switchOptionMozzarella: UISwitch!
    @IBOutlet weak var switchOptionCheddar: UISwitch!
    @IBOutlet weak var switchOptionParmesan: UISwitch!
    @IBOutlet weak var switchOptionNoCheese: UISwitch!
    
    var currentPizza: Pizza!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if currentPizza.cheese != nil {
            if currentPizza.cheese == "Mozzarella" {
                switchOptionMozzarella.setOn(true, animated: false)
            }
            else if currentPizza.cheese == "Cheddar" {
                switchOptionCheddar.setOn(true, animated: false)
            }
            else if currentPizza.cheese == "Parmesan" {
                switchOptionParmesan.setOn(true, animated: false)
            }
            else if currentPizza.cheese == "No Cheese" {
                switchOptionNoCheese.setOn(true, animated: false)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func changedMozzarrellaAction(_ sender: UISwitch) {
        if sender.isOn {
            switchOptionCheddar.setOn(false, animated: true)
            switchOptionParmesan.setOn(false, animated: true)
            switchOptionNoCheese.setOn(false, animated: true)
        }
        currentPizza.cheese = labelMozzarella.text
    }
    
    @IBAction func changedCheddarAction(_ sender: UISwitch) {
        if sender.isOn {
            switchOptionMozzarella.setOn(false, animated: true)
            switchOptionParmesan.setOn(false, animated: true)
            switchOptionNoCheese.setOn(false, animated: true)
        }
        currentPizza.cheese = labelCheddar.text
    }
    
    @IBAction func changedParmessanAction(_ sender: UISwitch) {
        if sender.isOn {
            switchOptionMozzarella.setOn(false, animated: true)
            switchOptionCheddar.setOn(false, animated: true)
            switchOptionNoCheese.setOn(false, animated: true)
        }
        currentPizza.cheese = labelParmesan.text
    }
    
    @IBAction func changedNoCheeseAction(_ sender: UISwitch) {
        if sender.isOn {
            switchOptionMozzarella.setOn(false, animated: true)
            switchOptionCheddar.setOn(false, animated: true)
            switchOptionParmesan.setOn(false, animated: true)
        }
        currentPizza.cheese = labelNoCheese.text
    }
    
    @IBAction func continueAction(_ sender: UIButton) {
        if switchOptionMozzarella.isOn || switchOptionCheddar.isOn || switchOptionParmesan.isOn || switchOptionNoCheese.isOn {
            self.performSegue(withIdentifier: "cheese-ingredients", sender: self)
        }
        else {
            let erroAlert = UIAlertController.init(title: "Sorry :(", message: "please select the type of cheese for your pizza", preferredStyle: .alert)
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
        let nextController = segue.destination as! FourthStageViewController
        nextController.currentPizza = currentPizza
    }
}
