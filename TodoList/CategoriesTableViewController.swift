//
//  CategoriesTableViewController.swift
//  TodoList
//
//  Created by Mike on 4/9/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController,UpdateCategoryTable {
    
    var list: [String:[[String:String]]] = [:]
    var selectedCategory : String = ""
    var tasksInCategory: TasksTableViewController?
    
    var newCategoryCell: CustomCell?
    
    
    func addNewTaskToCategory(_ category: String,newTask task:[String:String]) {
        list[category]?.append(task)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDoList = UserDefaults.standard.value(forKey: "todolist") {
            list = toDoList as! [String : [[String : String]]]
            //listCategories = list.keys
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row < list.count) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellCategory", for: indexPath)
            
            let category: String = Array(list.keys)[indexPath.row]
            cell.textLabel?.text = category
            cell.detailTextLabel?.text = "\(list[category]?.count ?? 0)"
            
            return cell
            
            
        }
        else {
            newCategoryCell = tableView.dequeueReusableCell(withIdentifier: "NewCategory", for: indexPath) as? CustomCell
            
            return newCategoryCell!
        }

        // Configure the cell...
    }
    
    @IBAction func addCategory(_ sender: UIButton) {
        let newCategoryName = newCategoryCell?.NewCategory.text
        list[newCategoryName!] = []
        
        if let toDoList = UserDefaults.standard.value(forKey: "todolist") {
            var listSaved = toDoList as! [String : [[String : String]]]
            listSaved[newCategoryName!] = []
            UserDefaults.standard.set(listSaved, forKey: "todolist")
        }
        else {
            UserDefaults.standard.set(list, forKey: "todolist")
        }
        newCategoryCell?.NewCategory.text = nil
        
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row < list.count) {
            selectedCategory = (tableView.cellForRow(at: indexPath)?.textLabel?.text)!
            performSegue(withIdentifier: "TasksSegue", sender: nil)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let vc = segue.destination as? TasksTableViewController
        
        vc?.title = selectedCategory
        vc?.elemente = list[selectedCategory]!
        tasksInCategory = vc
        tasksInCategory?.delegate = self
    }
    

}
