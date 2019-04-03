//
//  FriendsController.swift
//  myVK
//
//  Created by Дмитрий Яровой on 02/04/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class FriendsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifire = "FriendsViewCell"
    let segueIdentifire = "FotoAlbomSegue"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == segueIdentifire else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let friendAllFotoController = segue.destination as! FriendAllFotoController
        
        friendAllFotoController.friendData = FriendsModel.userFriendsArray[indexPath.row]
    }

}

extension FriendsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return FriendsModel.userFriendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as! FriendsViewCell
        let avatar = UIImage(named: FriendsModel.userFriendsArray[indexPath.row].fotoFriend)
        cell.avatarView.image = avatar
        cell.nameFriendLabel.text = FriendsModel.userFriendsArray[indexPath.row].nameFriend
        
        return cell
    }
    
}
