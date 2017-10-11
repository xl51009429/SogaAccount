//
//  MainViewController.swift
//  SogaAccount
//
//  Created by bigliang on 2017/9/20.
//  Copyright © 2017年 5i5j. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	fileprivate var tableView:UITableView?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.white
		
		self.tableView = UITableView(frame: CGRect.zero)
		self.tableView?.delegate = self
		self.tableView?.dataSource = self
		self.tableView?.rowHeight = 100
		self.tableView?.tableFooterView = UIView.init(frame: CGRect.zero)
		self.tableView?.register(AccountCell.classForCoder(), forCellReuseIdentifier:"accountCellId")
		self.view.addSubview(self.tableView!)
		
		self.tableView?.snp.makeConstraints({ (make) in
			make.edges.equalToSuperview()
		})
    }
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5;
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "accountCellId", for: indexPath)
		return cell;
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
		
    }
}
