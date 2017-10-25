//
//  AlertViewManager.swift
//  SogaAccount
//
//  Created by bigliang on 2017/10/20.
//  Copyright © 2017年 5i5j. All rights reserved.
//

import UIKit

enum AlertViewType {
	case normal
	case addRecord
}

enum AlertViewAnimation{
	case top
	case bottom
}

class AlertViewManager: NSObject {
	static let shared = AlertViewManager.init()
	
	fileprivate var addRecordAlertView:AddRecordAlertView!
	
	private override init() {
		super.init()
	}
	
	fileprivate var closure:((NSDictionary) -> Void)?
	
	
	func showAlertView(_ type:AlertViewType, animation:AlertViewAnimation, contentSize:CGSize, closure: @escaping (_ dict:NSDictionary) -> Void) {
		self.closure = closure;
		var alertController:BLAlertViewController?
		switch type {
		case .normal:
			return
		case .addRecord:
			let alertView = AddRecordAlertView.init(frame: CGRect(origin: CGPoint.zero, size: contentSize))
			alertController = BLAlertViewController(contentView: alertView)
			alertView.sureClosure = {
				[weak alertController]() in
				alertController?.dismiss(animated: true, completion: nil)
			}
		}
		alertController?.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5);
		alertController?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
		UIApplication.shared.keyWindow?.rootViewController?.present(alertController!, animated: true, completion: nil)
	}
}
