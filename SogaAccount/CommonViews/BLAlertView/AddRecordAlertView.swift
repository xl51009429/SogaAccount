//
//  AddRecordAlertView.swift
//  SogaAccount
//
//  Created by bigliang on 2017/10/23.
//  Copyright © 2017年 5i5j. All rights reserved.
//

import UIKit

class AddRecordAlertView: UIView,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {

	fileprivate var collectionView:UICollectionView!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.backgroundColor = UIColor.red
		
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
		layout.minimumLineSpacing = 1
		layout.minimumInteritemSpacing = 1
		layout.scrollDirection = UICollectionViewScrollDirection.horizontal
		
		self.collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		self.collectionView.register(AddRecordCell.classForCoder(), forCellWithReuseIdentifier: "AddRecordCellId")
		
		self.addSubview(self.collectionView)
		self.collectionView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 9;
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddRecordCellId", for: indexPath)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: UIScreen.width/5-10, height: UIScreen.width/5+10)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

class AddRecordCell: UICollectionViewCell {
	
	fileprivate var iconView: UIImageView!
	fileprivate var titleLabel: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.iconView = UIImageView()
		self.iconView.image = UIImage.init(named: "foot")
		self.contentView.addSubview(self.iconView)
		self.contentView.backgroundColor = UIColor.red
		self.iconView.snp.makeConstraints { (make) in
			make.top.left.right.equalTo(0)
			make.bottom.equalTo(-15)
		}
		
		self.titleLabel = UILabel()
		self.titleLabel.textAlignment = NSTextAlignment.center
		self.contentView.addSubview(self.titleLabel)
		self.titleLabel.snp.makeConstraints { (make) in
			make.left.right.bottom.equalTo(0)
			make.height.equalTo(20)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
