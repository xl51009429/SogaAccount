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
		self.tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier:"cellId")
		self.view.addSubview(self.tableView!)
		
		self.tableView?.snp.makeConstraints({ (make) in
			make.edges.equalToSuperview()
		})
    }
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5;
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
		cell.textLabel?.text = "big";
		return cell;
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
		
    }
}
