//
//  UserGroupsController.swift
//  myVK
//
//  Created by Дмитрий Яровой on 14/04/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class UserGroupsController: UIViewController, AllGroupsControllerDelegate {
  
    @IBOutlet weak var tableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "AllGroupsSegue":
            let destinationVC = segue.destination as! AllGroupsController
            destinationVC.delegate = self
        case "ViewPageGroupSegue":
            let destinationVC = segue.destination as! GroupPageController
            guard let indexPath = tableView.indexPathForSelectedRow else { break }
            destinationVC.group = Group.userGroupsArray[indexPath.row]
        default:
            break
        }
        
    }
    
    func addToTable(group: Group) {
        Group.userGroupsArray.append(group)
        self.tableView.reloadData()
    }
    
     
}

extension UserGroupsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Group.userGroupsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserGroupsCell", for: indexPath) as! UserGroupsCell
        cell.iconGroup.image = UIImage(named: Group.userGroupsArray[indexPath.row].nameIcon)
        cell.nameGroup.text = Group.userGroupsArray[indexPath.row].nameGroup
        print(Group.userGroupsArray.count)
        return cell
    }
}
