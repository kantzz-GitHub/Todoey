import UIKit

class TodoListViewController: UITableViewController {
    
    var listArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        listArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggos"
        listArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Destroy the monster"
        listArray.append(newItem3)
        
        listArray.append(newItem3)
        listArray.append(newItem3)
        listArray.append(newItem3)
        listArray.append(newItem3)
        listArray.append(newItem3)
        listArray.append(newItem3)
        listArray.append(newItem3)
        listArray.append(newItem3)
        listArray.append(newItem3)
        listArray.append(newItem3)
        listArray.append(newItem3)
        listArray.append(newItem3)
        listArray.append(newItem3)
        listArray.append(newItem3)
        listArray.append(newItem3)
        listArray.append(newItem3)
        listArray.append(newItem3)
        listArray.append(newItem3)
        
//        if let items = defaults.array(forKey: "TodoListArray") as? [String]{
//            listArray = items
//        }
        
    }
    
    //MARK: - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellID, for: indexPath)
        
        let item = listArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        if item.done == true{
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    //MARK: - tableView delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(listArray[indexPath.row])
        
        listArray[indexPath.row].done = !listArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            print(textField.text!)
            
            let newItem = Item()
            newItem.title = textField.text!
            self.listArray.append(newItem)
            self.defaults.set(self.listArray, forKey: "TodoListArray")
            self.tableView.reloadData()
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
}
