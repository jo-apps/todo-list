//
//  TodoListViewController.swift
//  Todo List
//
//  Created by Mac User on 31/07/2022.
//

import UIKit

class TodoListViewController: UITableViewController {

    var todoItems = ["Buy eggs", "Water plants"]
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

       if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark  {
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
       }
       else {
           tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
       }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TotoItemCell", for: indexPath)
        cell.textLabel?.text = todoItems[indexPath.row]
        return cell
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let strongSelf = self, let text = textField.text else {
                return
            }
            
            strongSelf.todoItems.append(text)
            strongSelf.tableView.reloadData()
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Add new item"
            textField = alertTextField
        }
        
        alert.addAction(action )
        present(alert, animated: true)
    }
}

