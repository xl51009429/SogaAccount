//
//  MainViewController.swift
//  SogaAccount
//
//  Created by bigliang on 2017/9/20.
//  Copyright © 2017年 5i5j. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

	fileprivate var mainView:MainView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.white
		self.title = "账单"
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(rightButtonClick))
		
		self.mainView = MainView()
		self.view.addSubview(self.mainView)
		
		self.mainView.snp.makeConstraints { (make) in
			make.edges.equalTo(0)
		}
    }
	
	@objc func rightButtonClick() {
		AlertViewManager.shared.showAlertView(AlertViewType.addRecord, animation: AlertViewAnimation.top, contentSize: CGSize.init(width: self.view.bounds.size.width, height: 300)) { (dic) in
			
		}
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
		
    }
}
