//
//  LJHomeViewController.swift
//  DYZB
//
//  Created by CLJ on 2018/12/23.
//  Copyright © 2018年 CLJ. All rights reserved.
//

import UIKit

private let titleViewH : CGFloat = 40
class LJHomeViewController: UIViewController {

    // MARK: - 懒加载属性
    private lazy var pageTitleView : LJPageTitleView = {
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = LJPageTitleView(frame: CGRect(x: 0, y: kStatusH + kNavBarH, width: kScreenW, height: titleViewH), titles: titles)
        return titleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - 设置界面
        setupUI()
    }
    

}


extension LJHomeViewController {
    private func setupUI(){

        // 不要调整scrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        // 设置导航栏
        setupNavigationBar()
        
        // 设置titleView
        view.addSubview(pageTitleView)
        
        
    }
    private func setupNavigationBar(){
        // leftBarButtonItem
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        // rightBarButtonItems
        let itemSize = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: itemSize)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: itemSize)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: itemSize)
        self.navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    }
    
    private func setupTitleView(){
    }
}
