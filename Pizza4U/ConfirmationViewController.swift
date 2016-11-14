//
//  ConfirmationViewController.swift
//  Pizza4U
//
//  Created by Alejandro on 11/13/16.
//  Copyright © 2016 soltek. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    @IBOutlet weak var textFieldSize: UITextField!
    @IBOutlet weak var textFieldDough: UITextField!
    @IBOutlet weak var textFieldCheese: UITextField!
    @IBOutlet weak var textFieldIngredients: UITextView!
    
    
    var currentPizza: Pizza!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textFieldSize.text = currentPizza.size
        textFieldDough.text = currentPizza.dough
        textFieldCheese.text = currentPizza.cheese
        
        let ingredientsFormat: NSMutableString = NSMutableString()
        for ingredient in currentPizza.ingredients {
            ingredientsFormat.appendFormat("%@ ", ingredient as! CVarArg)
        }
        textFieldIngredients.text = ingredientsFormat as String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func readyAction(_ sender: UIButton) {
        let finishAlert = UIAlertController.init(title: "Yeah !", message: "Your pizza is now being prepared :P", preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "Ok", style: .default, handler: {
            (alert: UIAlertAction!) in _=self.navigationController?.popToRootViewController(animated: true)}
        )

        
        finishAlert.addAction(okAction)
        self.present(finishAlert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
     self.navigationController?.dismiss(animated: true, completion: nil)
    }
    */

}
