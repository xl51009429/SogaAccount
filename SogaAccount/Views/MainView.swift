//
//  MainView.swift
//  SogaAccount
//
//  Created by bigliang on 2017/10/23.
//  Copyright © 2017年 5i5j. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView, UITableViewDelegate, UITableViewDataSource {

	fileprivate var tableView:UITableView?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.tableView = UITableView(frame: CGRect.zero)
		self.tableView?.delegate = self
		self.tableView?.dataSource = self
		self.tableView?.rowHeight = 100
		self.tableView?.tableFooterView = UIView.init(frame: CGRect.zero)
		self.tableView?.register(AccountCell.classForCoder(), forCellReuseIdentifier:"accountCellId")
		self.addSubview(self.tableView!)
		
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
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

class AccountCell: UITableViewCell {
	
	fileprivate var iconImage:UIImageView!
	fileprivate var	dateLabel:UILabel!
	fileprivate var remarkLabel:UILabel!
	fileprivate var categoryLabel:UILabel!
	fileprivate var priceLabel:UILabel!
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		bl_addSubViews();
	}
	
	func bl_addSubViews() {
		self.iconImage = UIImageView.init()
		self.iconImage.image = UIImage(named: "foot")
		self.contentView.addSubview(self.iconImage)
		
		self.dateLabel = UILabel.init()
		self.dateLabel.font = UIFont.systemFont(ofSize: 13)
		self.dateLabel.text = "2017-10-10"
		self.contentView.addSubview(self.dateLabel)
		
		self.remarkLabel = UILabel.init()
		self.remarkLabel.font = UIFont.systemFont(ofSize: 13)
		self.remarkLabel.text = "苹果，香蕉"
		self.contentView.addSubview(self.remarkLabel)
		
		self.categoryLabel = UILabel.init()
		self.categoryLabel.font = UIFont.systemFont(ofSize: 15)
		self.categoryLabel.text = "美食"
		self.contentView.addSubview(self.categoryLabel)
		
		self.priceLabel = UILabel.init()
		self.priceLabel.font = UIFont.systemFont(ofSize: 18)
		self.priceLabel.textColor = UIColor.red
		self.priceLabel.text = "¥ 200"
		self.priceLabel.textAlignment = NSTextAlignment.right
		self.contentView.addSubview(self.priceLabel)
		
		self.iconImage.snp.makeConstraints { (make) in
			make.left.equalTo(20)
			make.centerY.equalToSuperview()
			make.size.equalTo(CGSize.init(width: 60, height: 60))
		}
		
		self.priceLabel.snp.makeConstraints { (make) in
			make.right.equalTo(-20)
			make.size.equalTo(CGSize.init(width: 50, height: 30))
			make.centerY.equalTo(self.contentView.snp.centerY).offset(0)
		}
		
		self.categoryLabel.snp.makeConstraints { (make) in
			make.left.equalTo(100)
			make.centerY.equalTo(self.contentView.snp.centerY).offset(-15)
			make.right.equalTo(-90)
			make.height.equalTo(20)
		}
		
		self.dateLabel.snp.makeConstraints { (make) in
			make.left.equalTo(100)
			make.centerY.equalTo(self.contentView.snp.centerY).offset(15)
			make.width.equalTo(100)
			make.height.equalTo(20)
		}
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}
