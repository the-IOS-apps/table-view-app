//
//  RecipesTableController.swift
//  ok-client
//
//  Created by the-teacher on 20/05/15.
//  Copyright (c) 2015 the-teacher. All rights reserved.
//

import UIKit
import Alamofire

class RecipesTableController: UITableViewController, UITextFieldDelegate {
    // MARK: - VARIABLES
    var recipes = [[Recipe]]()

    var searchText:String? = "cupcake" {
        didSet {
            log("VAR: searchText changed to \(searchText!)")

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

    // something like settings
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

    // MARK: - LIFE-CICLE

    // After instantiation and outlet-setting
    override func viewDidLoad() {
        log("viewDidLoad")

        super.viewDidLoad()
        refresh()

        // Create custom text field event
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

    // MARK: - TEXT INPUT EVENTS

    // on Enter pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        log("TEXT INPUT: => ENTER")

        if textField == searchTextField {
            // it's just close keyboard
            textField.resignFirstResponder()

            // set new value of variable
            searchText = textField.text
        }

        return true
    }

    // on before keyboard appears
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        log("TEXT INPUT: => BEFORE KEYBOARD APPEARS")
        return true
    }

    // on after keyboard appears
    func textFieldDidBeginEditing(textField: UITextField) {
        log("TEXT INPUT: => AFTRE KEYBOARD APPEARS")
    }

    // on Change
    // * custom Input Event
    func textFieldDidChange(textField: UITextField) {
        log("TEXT INPUT: => ON CHANGE")

        if textField == searchTextField {
            // set new value of variable
            searchText = textField.text
        }
    }

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

    // MARK: - TABE VIEW IMPLEMENTATION

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        log("TableView: SECTIONS calcualtion")
        return recipes.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        log("TableView: ROWS in SECTION calcualtion")
        return recipes[section].count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        log("TableView: CELL building")

        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIndex, forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        let recipe = recipes[indexPath.section][indexPath.row]

        cell.textLabel?.text       = recipe.title
        cell.detailTextLabel?.text = recipe.intro

        return cell
    }

    // override func didReceiveMemoryWarning() {
    //     super.didReceiveMemoryWarning()
    //     // Dispose of any resources that can be recreated
    // }

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
