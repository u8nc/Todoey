//
//  ViewController.swift
//  Todoey
//
//  Created by luobote on 11/10/18.
//  Copyright © 2018 u8nc. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    //    when was this told to be deleted ??
    //    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
    
        
        //        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
        //            itemArray = items
//         }
    
}

// MARK - Tableview Datasource Methods

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemArray.count
}

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    let item = itemArray[indexPath.row]
    
    cell.textLabel?.text = item.title
    // Ternary operator ==>
    // value = condition ? valueIfTrue : valueIfFalse
    
    cell.accessoryType = item.done ? .checkmark : .none
    // then why is the toggle here?? and not in the function below?
    // transcribe this lesso

    return cell
}

//MARK -  TableView Delegate Methods

override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    itemArray[indexPath.row].done = !itemArray[indexPath.row].done
    saveItems()
    
    // this is a point in the video that shows transcription is right where she got it wrong.
    // this is not the place where you toggle checkmark
    
    tableView.deselectRow(at: indexPath, animated: true)
}



//MARK - Add New Items

@IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    
    
    var textField = UITextField()
    let alert = UIAlertController(title: "Add New TODOEY Item", message: "", preferredStyle: .alert)
    let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
        
        let newItem = Item()
        newItem.title = textField.text!
        self.itemArray.append(newItem)
        self.saveItems()
        
    }
    
    alert.addTextField { (alertTextField) in
        
        alertTextField.placeholder = "Create New Item"
        textField = alertTextField
        //                print(alertTextField.text!)
        
    }
    
    alert.addAction(action)
    self.present(alert, animated: true, completion: nil)
}
    
    
    func loadItems() {
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
            itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error decoding item array, \(error)")
            }
        }
    }
    
    func saveItems() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    
    
}


