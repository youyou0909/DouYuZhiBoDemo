//
//  LJPageTitleView.swift
//  DYZB
//
//  Created by CLJ on 2018/12/23.
//  Copyright © 2018年 CLJ. All rights reserved.
//

import UIKit

private let kScrollLineH : CGFloat = 2
class LJPageTitleView: UIView {

    // MARK: - 定义属性
    private var titles:[String]
    
    // MARK: - 懒加载属性
    private lazy var titleLabels : [UILabel] = [UILabel]()
    private lazy var scrollView : UIScrollView = {
       let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.bounces = false
        scroll.isPagingEnabled = false
        return scroll
    }()
    
    private lazy var scrollLine:UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    // MARK: - 自定义构造器
    init(frame: CGRect, titles:[String]) {
        self.titles = titles
        super.init(frame: frame)
        // MARK: - 界面搭建
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LJPageTitleView{
    
    // 界面搭建
    private func setupUI(){
        // 添加scrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        // 添加title对应的label
        addTitleLabels()
        
        // 设置底线和滚动条
        setupBottomLineAndScrollLine()
    }
    
    private func addTitleLabels() {
        for (index,title) in titles.enumerated() {
            
            let label = UILabel()
            // 设置label属性
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.text = title
            
            // 设置lable的frame
            let labelCount = titles.count > 4 ? 4 : titles.count
            let labelW : CGFloat = kScreenW / CGFloat(labelCount)
            let labelH : CGFloat = frame.size.height
            let labelX : CGFloat = labelW * CGFloat(index)
            let labelY : CGFloat = 0
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            // 添加label
            scrollView.addSubview(label)
            titleLabels.append(label)
        }
    }
    
    private func setupBottomLineAndScrollLine() {
        // 底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        bottomLine.frame = CGRect(x: 0, y: frame.size.height - 0.5, width: frame.size.width, height: 0.5)
        addSubview(bottomLine)
        
        //滚动条
        addSubview(scrollLine)
        guard let firstLab = titleLabels.first else{return}
        
        scrollLine.frame = CGRect(x: firstLab.frame.origin.x, y: firstLab.frame.size.height - kScrollLineH, width: firstLab.frame.size.width, height: kScrollLineH)
    }
}
