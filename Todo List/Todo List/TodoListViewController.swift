//
//  TodoListViewController.swift
//  Todo List
//
//  Created by Mac User on 31/07/2022.
//

import UIKit

class TodoListViewController: UITableViewController {
    var todoItems = [TodoItem]()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        todoItems.append(TodoItem(title: "Buy eggs"))
        todoItems.append(TodoItem(title: "Water plants"))
        todoItems.append(TodoItem(title: "Sleep"))
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todoItems[indexPath.row].checked = !todoItems[indexPath.row].checked
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TotoItemCell", for: indexPath)
        let item = todoItems[indexPath.row]

        cell.textLabel?.text = item.title
        cell.accessoryType = item.checked ? .checkmark : .none

        return cell
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let strongSelf = self, let text = textField.text else {
                return
            }
            
            strongSelf.todoItems.append(TodoItem(title: text))
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

