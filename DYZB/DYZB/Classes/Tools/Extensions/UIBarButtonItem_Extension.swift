//
//  UIBarButtonItem_Extension.swift
//  DYZB
//
//  Created by CLJ on 2018/12/23.
//  Copyright © 2018年 CLJ. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(imageName:String,highImageName:String = "",size:CGSize = CGSize.zero) {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named:imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage(named:highImageName), for: .highlighted)
        }
        
        if size == CGSize.zero {
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        self.init(customView: btn)
    }
}
