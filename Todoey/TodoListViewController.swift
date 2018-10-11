//
//  ViewController.swift
//  Todoey
//
//  Created by luobote on 11/10/18.
//  Copyright © 2018 u8nc. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Jobsearches","Find things","HT matters" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK -  TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        if ( tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark) {
            print("turn it off")
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            print("turn it on")
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New TODOEY Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
             }
        
            alert.addTextField { (alertTextField) in
                
                alertTextField.placeholder = "Create New Item"
                textField = alertTextField
                print(alertTextField.text!)
          
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}


