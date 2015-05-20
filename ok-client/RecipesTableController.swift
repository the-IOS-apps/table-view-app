//
//  RecipesTableController.swift
//  ok-client
//
//  Created by the-teacher on 20/05/15.
//  Copyright (c) 2015 the-teacher. All rights reserved.
//

import UIKit

class RecipesTableController: UITableViewController {
    
    // MARK: - Variables
    
    var recipes = [[Recipe]]()
    
    private struct Storyboard {
        static let CellReuseIndex = "Recipe"
    }

    // MARK: - LifeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 1...15 {
            var recipe = Recipe(
                title:   "Test Recipe \(index)",
                intro:   "Test Recipe Intro \(index)",
                content: "Test Recipe COntent \(index)"
            )
            
            recipes.append([recipe])
            println(recipe.title!)
        }

        // ******************************************
        
        // main_queue = dispatch_get_main_queue()
        // closure = { ... }
        // dispatch_async(main_queue, closure)

        // Method for reloading TableView
        // self.tableView.reloadData()
        
        // ******************************************

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - TableVewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return recipes.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return recipes[section].count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIndex, forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        let recipe = recipes[indexPath.section][indexPath.row]
        cell.textLabel?.text = recipe.title
        cell.detailTextLabel?.text = recipe.intro

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
