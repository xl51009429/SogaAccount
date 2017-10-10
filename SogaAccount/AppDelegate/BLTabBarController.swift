//
//  BLTabBarController.swift
//  SogaAccount
//
//  Created by bigliang on 2017/9/20.
//  Copyright © 2017年 5i5j. All rights reserved.
//

import UIKit

class BLTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		let mainCon = MainViewController();
		mainCon.tabBarItem.title = "one";
		mainCon.tabBarItem.image = UIImage(named: "account");
		let mainNav = UINavigationController(rootViewController: mainCon);
		self.addChildViewController(mainNav);
    }

}
