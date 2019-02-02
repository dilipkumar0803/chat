//
//  SettingsViewController.swift
//  newchatapp
//
//  Created by dilip kumar on 29/01/19.
//  Copyright © 2019 dilip kumar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var photoUpdate: UIButton!
    
    var selectedUser:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
