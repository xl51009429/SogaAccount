//
//  AddRecordAlertView.swift
//  SogaAccount
//
//  Created by bigliang on 2017/10/23.
//  Copyright © 2017年 5i5j. All rights reserved.
//

import UIKit

class AddRecordAlertView: UIView,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {

	public var sureClosure:(()->Void)?
	private var collectionView: UICollectionView!
	private var priceTextField: UITextField!
	private var desTextField: UITextField!
	private var sureBtn: UIButton!
	private let numOfLine = 8
	private let titles = ["美食1","美食2","美食3","美食4","美食","美食","美食","美食","美食"]
	private let images = ["foot","foot","foot","foot","foot","foot","foot","foot","foot"]
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.white
		
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
		layout.minimumLineSpacing = 10
		layout.minimumInteritemSpacing = 10
		layout.scrollDirection = UICollectionViewScrollDirection.vertical
		
		self.collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		self.collectionView.backgroundColor = UIColor.white
		self.collectionView.contentInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
		self.collectionView.register(AddRecordCell.classForCoder(), forCellWithReuseIdentifier: "AddRecordCellId")
		self.addSubview(self.collectionView)
		
		self.priceTextField = UITextField.init()
		self.priceTextField.placeholder = "价格"
		self.priceTextField.font = UIFont.H12
		self.addSubview(self.priceTextField)
		
		self.desTextField = UITextField.init()
		self.desTextField.placeholder = "描述"
		self.desTextField.font = UIFont.H12
		self.addSubview(self.desTextField)
		
		self.sureBtn = UIButton.init()
		self.sureBtn.setTitle("确定", for: UIControlState.normal)
		self.sureBtn.backgroundColor = UIColor.orange
		self.sureBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
		self.sureBtn.addTarget(self, action: #selector(sureBtnClick), for: UIControlEvents.touchUpInside)
		self.addSubview(self.sureBtn)
		
		self.collectionView.snp.makeConstraints { (make) in
			make.left.right.top.equalTo(0)
			make.height.equalTo(((UIScreen.width - CGFloat(10*(self.numOfLine+1)))/CGFloat(self.numOfLine) + 10)*2 + 50)
		}
		
		self.priceTextField.snp.makeConstraints { (make) in
			make.left.equalTo(10)
			make.right.equalTo(-10)
			make.height.equalTo(30)
			make.top.equalTo(self.collectionView.snp.bottom).offset(10)
		}
		
		self.desTextField.snp.makeConstraints { (make) in
			make.left.equalTo(10)
			make.right.equalTo(-10)
			make.height.equalTo(30)
			make.top.equalTo(self.priceTextField.snp.bottom).offset(10)
		}
		
		self.sureBtn.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.size.equalTo(CGSize(width: 80, height: 30))
			make.top.equalTo(self.desTextField.snp.bottom).offset(10)
		}
		
	}
	
	@objc func sureBtnClick() {
		if let _ = self.sureClosure{
			self.sureClosure!()
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 9;
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell: AddRecordCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddRecordCellId", for: indexPath) as! AddRecordCell
		cell .updateCell(title: titles[indexPath.row], imageName: images[indexPath.row])
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: (UIScreen.width - CGFloat(10*(self.numOfLine+1)))/CGFloat(self.numOfLine), height: (UIScreen.width - CGFloat(10*(self.numOfLine+1)))/CGFloat(self.numOfLine) + 10)
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
		self.iconView.snp.makeConstraints { (make) in
			make.top.left.right.equalTo(0)
			make.bottom.equalTo(-15)
		}
		
		self.titleLabel = UILabel()
		self.titleLabel.textAlignment = NSTextAlignment.center
		self.titleLabel.font = UIFont.H12
		self.contentView.addSubview(self.titleLabel)
		self.titleLabel.snp.makeConstraints { (make) in
			make.left.right.bottom.equalTo(0)
			make.height.equalTo(20)
		}
	}
	
	func updateCell(title:String,imageName:String){
		self.iconView.image = UIImage(named: imageName)
		self.titleLabel.text = title
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
