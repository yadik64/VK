//
//  GroupPageController.swift
//  myVK
//
//  Created by Дмитрий Яровой on 14/04/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class GroupPageController: UIViewController {

    @IBOutlet weak var iconGroup: AvatarView!
    @IBOutlet weak var nameGroup: UILabel!
    
    var group: Group?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPage()
    }
    
    private func createPage() {
        guard let icon = group?.nameIcon,
              let name = group?.nameGroup else { return }
        
        self.iconGroup.image = UIImage(named: icon)
        self.nameGroup.text = name
    }
}
