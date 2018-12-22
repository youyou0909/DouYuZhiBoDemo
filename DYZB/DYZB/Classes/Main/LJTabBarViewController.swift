//
//  LJTabBarViewController.swift
//  DYZB
//
//  Created by CLJ on 2018/12/22.
//  Copyright © 2018年 CLJ. All rights reserved.
//

import UIKit

class LJTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVC(storyName: "home")
        addChildVC(storyName: "live")
        addChildVC(storyName: "follow")
        addChildVC(storyName: "me")
    }
    private func addChildVC(storyName:String){
        let childVC = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        addChild(childVC)
    }

}
