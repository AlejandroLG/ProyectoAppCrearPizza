//
//  FourthStageViewController.swift
//  Pizza4U
//
//  Created by Alejandro on 11/13/16.
//  Copyright © 2016 soltek. All rights reserved.
//

import UIKit

class FourthStageViewController: UITableViewController {
    var ingredients: NSArray = NSArray()
    var selectedIngredients: NSMutableArray!
    var currentPizza: Pizza!
    var ingredientsCounter: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
        self.tableView.isEditing = true

        ingredients = ["Ham","Pepperoni","Turkey","Sausage","Olive", "Onion","Pepper","Pinnacle","Anchovy"]
        selectedIngredients = currentPizza.ingredients != nil ? currentPizza.ingredients as! NSMutableArray : NSMutableArray()
        ingredientsCounter = selectedIngredients.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIndicator", for: indexPath)
        cell.textLabel?.text = (ingredients.object(at: indexPath.row) as! NSString) as String
        if selectedIngredients.contains((cell.textLabel?.text)! as String) {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if ingredientsCounter >= 5 {
            tableView.deselectRow(at: indexPath, animated: true)
            let errorAlert = UIAlertController.init(title: "Sorry :(", message: "You only can select 5 ingredients maximum", preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "Ok", style: .cancel, handler: nil)
            errorAlert.addAction(okAction)
            self.present(errorAlert, animated: true, completion: nil)
        }
        else {
            ingredientsCounter = ingredientsCounter + 1
            selectedIngredients.add(ingredients.object(at: indexPath.row))
            currentPizza.ingredients = selectedIngredients
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let index = selectedIngredients.index(of: ingredients.object(at: indexPath.row))
        selectedIngredients.removeObject(at: index)
        currentPizza.ingredients = selectedIngredients
        ingredientsCounter = ingredientsCounter == 0 ? 0 : ingredientsCounter - 1
    }

    @IBAction func finishPizza(_ sender: UIBarButtonItem) {
        if ingredientsCounter > 0 {
            self.performSegue(withIdentifier: "ingredients-confirmation", sender: self)
        }
        else {
            let errorAlert = UIAlertController.init(title: "Sorry :(", message: "You must select at least 1 ingredient", preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "Ok", style: .cancel, handler: nil)
            errorAlert.addAction(okAction)
            self.present(errorAlert, animated: true, completion: nil)
        }
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextController =  segue.destination as! ConfirmationViewController
        nextController.currentPizza = currentPizza
     }
}
