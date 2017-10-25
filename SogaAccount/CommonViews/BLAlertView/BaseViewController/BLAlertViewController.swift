//
//  BLAlertViewController.swift
//  SogaAccount
//
//  Created by bigliang on 2017/10/20.
//  Copyright © 2017年 5i5j. All rights reserved.
//

import UIKit

class BLAlertViewController: UIViewController {

	fileprivate var contentView: UIView?
	
	init(contentView:UIView) {
		super.init(nibName: nil, bundle: nil)
		self.view.addSubview(contentView)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	

}
