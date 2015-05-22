//
//  RecipesTableController.swift
//  ok-client
//
//  Created by the-teacher on 20/05/15.
//  Copyright (c) 2015 the-teacher. All rights reserved.
//

import UIKit

class RecipesTableController: UITableViewController, UITextFieldDelegate {
  
    func log(let str:String?){ println(str) }
    
    // MARK: - VARIABLES
    
    var recipes = [[Recipe]]()
    var searchText:String? = "cupcake" {
        didSet {
            log("VAR: search text changed")
            
            // Update text input
            // Just to be ensured
            searchTextField?.text = searchText
            
            // Cleanup Array
            recipes.removeAll()
            
            // Rebuild Array
            refresh()

            // Table view reload
            tableView.reloadData()
        }
    }
    
    private struct Storyboard {
        static let CellReuseIndex = "Recipe"
    }

    // MARK: - OUTLETS
    
    
    
    @IBOutlet weak var searchTextField: UITextField! {
        didSet{
            log("UI field is set/ DELEGATE")

            // link with this Controller for input processing with `textFieldShouldReturn`
            searchTextField.delegate = self
            
            // set default value
            searchTextField.text = searchText
        }
    }
    
    // on keyboard will be appeared
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        log("textFieldShouldBeginEditing")
        return true
    }
    
    // on keyboard is appeared
    func textFieldDidBeginEditing(textField: UITextField) {
        log("textFieldDidBeginEditing")
    }
    
    // Q: is it the just place to process all text fields of this Controllers?
    // hm!
    // Event `on enter` for input field
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        log("==============================================")
        log("textFieldShouldReturn: UI field some action")
        
        if textField == searchTextField {
            // it's just close keyboard
            textField.resignFirstResponder()
            
            // set new value of variable
            searchText = textField.text
        }

        return true
    }
    
    // Custom input field event `on change`
    func textFieldDidChange(textField: UITextField) {
        log("text field did chenged!")
        
        if textField == searchTextField {
            // set new value of variable
            searchText = textField.text
        }
    }
    
    // MARK: - ACTIONS

    // MARK: - COMMON FUNCTIONS

    func refresh() {
        log("REFRESH: build and set recipes")
        
        for index in 1...15 {
            var prefix = searchText!
            var recipe = Recipe(
                title:   "\(prefix) Recipe \(index)",
                intro:   "\(prefix) Recipe Intro \(index)",
                content: "\(prefix) Recipe COntent \(index)"
            )
            
            recipes.append([recipe])
        }
    }
    
    // MARK: - LIFE-CICLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        log("viewDidLoad")
        refresh()
        
        // Q: where and when outlets are available?
        searchTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        
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
        log("Table SECTIONS calcualtion")
        return recipes.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        log("Table ROWS in SECTION count calcualtion")
        return recipes[section].count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIndex, forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        let recipe = recipes[indexPath.section][indexPath.row]
        cell.textLabel?.text = recipe.title
        cell.detailTextLabel?.text = recipe.intro

        log("CELL building")
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
