//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Gene M. Angelo  Jr. on 9/18/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    // MARK: Properties
    @IBOutlet var editButton: ToggleBarButtonItem!
    
    private static let editButtonTitles = ["Edit", "Done"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Add an edit button to initiate allowing the user to reorder contacts.
        
        self.editButton = ToggleBarButtonItem(titles: (title0: "Edit", title1: "Done"), style: .plain, target: self, action: #selector(ContactsTableViewController.toggleEdit))
        self.navigationItem.leftBarButtonItem = self.editButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactHelper.instance.getContacts().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! ContactTableViewCell
        
        cell.contact = ContactHelper.instance.getContacts()[indexPath.row]
        
        return cell
    }
    
    @IBAction func unwindToContactsTableViewController(segue: UIStoryboardSegue) {
        //nothing goes here
    }
    
    func toggleEdit() {
        editButton.toggle()
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let contactTableViewCell = tableView.cellForRow(at: indexPath) as! ContactTableViewCell
            let _ = ContactHelper.instance.deleteContact(contact: contactTableViewCell.contact)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

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
        if (segue.identifier == "viewContactDetailSegue") {
            let navigationController = segue.destination as! UINavigationController
            if let contactDetailsViewController = navigationController.topViewController as? ContactDetailsViewController {
                if let cell = sender as? ContactTableViewCell {
                    contactDetailsViewController.contact =  cell.contact
                }
            }
        }
    }
}







