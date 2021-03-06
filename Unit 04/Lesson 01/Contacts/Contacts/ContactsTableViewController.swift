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
    @IBOutlet var addButton: UIBarButtonItem!
    
    fileprivate static let editButtonTitles = ["Edit", "Done"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Add an edit button to initiate allowing the user to reorder contacts.
        self.editButton = ToggleBarButtonItem(titles: (title0: "Edit", title1: "Done"), style: .plain, target: self, action: #selector(ContactsTableViewController.toggleEdit))
        self.navigationItem.leftBarButtonItem = self.editButton
        
        // Add an Add Contact button to add contacts.
        self.addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ContactsTableViewController.addContact))
        self.navigationItem.rightBarButtonItem = self.addButton
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
    
    @IBAction func unwindToContactsTableViewController(_ segue: UIStoryboardSegue) {
        // Nothing goes here
    }
    
    func toggleEdit() {
        editButton.toggle()
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    func addContact() {
        let newContact = Contact(name: "New Contact")
        ContactHelper.instance.append(contact: newContact)
        let newIndexPath = IndexPath(row: ContactHelper.instance.getContacts().count - 1, section: 0)
        self.tableView.insertRows(at: [newIndexPath], with: .automatic)
        // open func scrollToRow(at indexPath: IndexPath, at scrollPosition: UITableViewScrollPosition, animated: Bool)
        self.tableView.scrollToRow(at: newIndexPath, at: UITableViewScrollPosition.bottom, animated: true)
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let contactTableViewCell = tableView.cellForRow(at: indexPath) as! ContactTableViewCell
            let _ = ContactHelper.instance.deleteContact(contactTableViewCell.contact)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        var contacts = ContactHelper.instance.getContacts()
        let contactMoved = contacts.remove(at: fromIndexPath.row)
        contacts.insert(contactMoved, at: to.row)
    }

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
    
    // These two methods remove the "-" button that appears after clicking the Edit button.
    // We want to do this because we implement swipe to delete, so having both would be
    // redundant.
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return tableView.isEditing ? .none : .delete
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}







