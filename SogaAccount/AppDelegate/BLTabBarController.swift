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
		
		//账单界面
		let mainCon = MainViewController();
		mainCon.tabBarItem.title = "账单";
		mainCon.tabBarItem.image = UIImage(named: "account");
		let mainNav = UINavigationController(rootViewController: mainCon);
		self.addChildViewController(mainNav);
		
		//我的界面
		let mineCon = MineViewController();
		mineCon.tabBarItem.title = "我的";
		mineCon.tabBarItem.image = UIImage(named: "mine");
		let mineNav = UINavigationController(rootViewController: mineCon);
		self.addChildViewController(mineNav);
		
    }

}
