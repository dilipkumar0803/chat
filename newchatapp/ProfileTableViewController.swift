//
//  ProfileTableViewController.swift
//  newchatapp
//
//  Created by dilip kumar on 28/01/19.
//  Copyright © 2019 dilip kumar. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    var selectedUser:User?

    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileManager.fillUsers {
            () in
            DispatchQueue.main.async {
                self.tableView.reloadData()

            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ProfileManager.users.count
        //return ProfileManager.users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell

        let u = ProfileManager.users[indexPath.row]
        
        //cell.cellName.text = "text"
        cell.cellName.text = u.username
        cell.cellImage.image = UIImage(named: "NetworkProfile.png")
        if (u.profileImageUrl != ""){
            cell.cellImage.image = u.getProfileImage()
        }
        else {
            cell.cellImage.image = UIImage(named:"NetworkProfile.png")
        }
        // Configure the cell...

        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // selectedUser = ProfileManager.users[indexPath.row]
        
        self.performSegue(withIdentifier: "showChatView", sender: self)
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

    
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showChatview",
//            let destinationViewController = segue.destination as? ChatViewController {
//            destinationViewController.selectedUser = selectedUser
//        } else if segue.identifier == "SettingsViewController",
//            let destinationViewController = segue.destination as? SettingsViewController{
//            destinationViewController.selectedUser = ProfileManager.getCurrentUser(uid: FirebaseManager.currentUserId)
//        }
//
//    }
 

    
    
    
    
    
}
