//
//  FriendsController.swift
//  myVK
//
//  Created by Дмитрий Яровой on 02/04/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class FriendsController: UIViewController {

//TODO: - Outlets
    
    @IBOutlet weak var tableView: UITableView!

//TODO: - Propertis
    
    let searchController = UISearchController(searchResultsController: nil)
    let cellIdentifire = "FriendsViewCell"
    let segueIdentifire = "FotoAlbomSegue"
    
// FriendsController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
    }
    
//TODO: - SearchController Methods
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Поиск друга"
        definesPresentationContext = true
    }
    
    private func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func isFiltered() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    private func filterContentForSearchText(searchText: String) {
        FriendsModel.filterFriendsArray = FriendsModel.userFriendsArray.filter{ $0.nameFriend.lowercased().contains(searchText.lowercased())}
        
        tableView.reloadData()
    }
    
//TODO: - Data transmission Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == segueIdentifire else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let friendAllFotoController = segue.destination as! FriendAllFotoController
        let friendData = isFiltered() ?
            FriendsModel.filterFriendsArray[indexPath.row] :
            FriendsModel.userFriendsArray[indexPath.row]
        
        friendAllFotoController.friendData = friendData
    }

}

//TODO: - Extensions

extension FriendsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard isFiltered() else { return FriendsModel.userFriendsArray.count }
        return FriendsModel.filterFriendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as! FriendsViewCell
        
        let avatar = isFiltered() ?
            UIImage(named: FriendsModel.filterFriendsArray[indexPath.row].fotoFriend) :
            UIImage(named: FriendsModel.userFriendsArray[indexPath.row].fotoFriend)
        let name = isFiltered() ?
            FriendsModel.filterFriendsArray[indexPath.row].nameFriend :
            FriendsModel.userFriendsArray[indexPath.row].nameFriend
        
        cell.avatarView.image = avatar
        cell.nameFriendLabel.text = name
        
        return cell
    }
    
}

extension FriendsController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}
