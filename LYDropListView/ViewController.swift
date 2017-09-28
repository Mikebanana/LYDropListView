//
//  ViewController.swift
//  LYDropListView
//
//  Created by discover on 2017/9/28.
//  Copyright © 2017年 LY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let moneyArray:[String] = ["不限金额","0~1000元","1001~2000元","2001~3000元","3001~5000元","5000元以上"]
    let limitArray:[String] = ["不限期限","0~14天","15~30天","30~60天","60~90天","90~180天","180~360天","360天以上"]
    let sortArray:[String] = ["默认排序","贷款成功率 ↓","日费率 ↑"]
  
    
    lazy var dropList:LYDropListView = {
        //传入一个二维数组即可
        let drop = LYDropListView.init(frame: CGRect.init(x: 0, y: kNaviHeight, width: screenWidth, height: 40), tableArr:[self.moneyArray,self.limitArray,self.sortArray])
        drop.selectClosure = { (_ tag:Int,_ row:Int)->Void in
         //tag-100 就是二维数组第几个 row就是第几个cell
          print(tag-100,row)
          
            
        }
        return drop
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       view.addSubview(dropList)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

