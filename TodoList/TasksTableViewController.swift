//
//  TasksTableViewController.swift
//  TodoList
//
//  Created by Mike on 4/9/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

protocol UpdateCategoryTable {
    func addNewTaskToCategory(_ category:String,newTask task:[String:String])
}

class TasksTableViewController: UITableViewController,UpdateTable {
    
    var delegate: UpdateCategoryTable?

    var addTask: ViewController? //tine minte si asta!!! fff important!!
    
    var elemente = [[String:String]]()
    
    func updateTableFromList(_ list: [String : String]) {
        elemente.append(list)
        delegate?.addNewTaskToCategory(self.navigationItem.title!, newTask: list)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //ffff important!!!
        if segue.identifier == "Add Task" {
            addTask = segue.destination as? ViewController
            addTask?.delegate = self //tine minte asta!!
            addTask?.currentCategory = self.navigationItem.title!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*if let values = UserDefaults.standard.value(forKey: "todolist") as? [[String:String]] {
            self.elemente = values
        }*/


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
        return elemente.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = elemente[indexPath.row]["title"]
        cell.detailTextLabel?.text =  elemente[indexPath.row]["desc"]
        
        return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
