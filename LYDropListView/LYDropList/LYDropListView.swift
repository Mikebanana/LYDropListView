//
//  LYDropListView.swift
//  LYDropListView
//
//  Created by discover on 2017/9/28.
//  Copyright © 2017年 LY. All rights reserved.
//

import UIKit

class LYDropListView: UIView,UITableViewDelegate,UITableViewDataSource{
    fileprivate var cellid = "cellid"
   lazy  var titleArray = [String]()
   lazy  var tableArray = [[String]]()

    var maskViewSS:UIView?
    var selectClosure:((_ tag:Int,_ row:Int)->Void)?
    init(frame: CGRect,tableArr:[[String]]) {
        super.init(frame: frame)
        self.titleArray = tableArr.map({ (arr) -> String in
            return arr[0]
        })
        self.tableArray = tableArr
        self.backgroundColor = UIColor.white
        self.setTitleButton()
        setMaskView()
        setTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setMaskView(){
        maskViewSS = UIView.init(frame: CGRect.init(x: 0, y: 40, width: screenWidth, height: screenHeight-40-kNaviHeight))
        maskViewSS?.backgroundColor = RGBA(r: 0, g: 0, b: 0, a: 0.3)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
       
        maskViewSS?.alpha = 0
        maskViewSS?.addGestureRecognizer(tap)
        
    }
    func tapAction(){
//        self.maskViewSS?.removeFromSuperview()
        for i in 0..<self.tableArray.count{
            let tableView = self.viewWithTag(100+i) as! UITableView
            let drop = self.viewWithTag(1000+i) as! LYDropListTItleView
            
            if tableView.frame.height>1{
                drop.isSelected = false
                
//                UIView.animate(withDuration: 0.2, animations: {
//                    tableView.frame = CGRect.init(x: 0, y: 40, width: screenWidth, height: 1)
//                })
                UIView.animate(withDuration: 0.2, animations: {
                    tableView.frame = CGRect.init(x: 0, y: 40, width: screenWidth, height: 1)
                    self.maskViewSS?.alpha = 0
                }, completion: { (idCom) in
                    self.maskViewSS?.removeFromSuperview()
                })
                
            }
        }
    }
    func setTitleButton(){
        let totalArry:Array<Array<String>>  = self.tableArray
        let width:CGFloat = screenWidth/CGFloat(titleArray.count)
        
        for i in 0..<self.titleArray.count{
            let view = LYDropListTItleView.init(frame: CGRect.init(x: CGFloat(i)*width, y: 0, width: width, height: 40), title: titleArray[i])
            view.tag = 1000+i
            view.gesClosure = { (select)->Void in
                self.insertSubview(self.maskViewSS!, at: 0)
                UIView.animate(withDuration: 0.2, animations: {
                    self.maskViewSS?.alpha = 1
                })
                if select {
                    
                    for n in 0..<self.titleArray.count {
                        let drop = self.viewWithTag(1000+n) as! LYDropListTItleView
                        let tableView = self.viewWithTag(100+n) as! UITableView
                        if i == n {
                            drop.isSelected = true
                            
                            
                        }else{
                            drop.isSelected = false
                        }
                        let arr = totalArry[n] as [String]
                        tableView.reloadData()
                      
                        if i == n {
                            UIView.animate(withDuration: 0.2, animations: {
                                tableView.frame = CGRect.init(x: 0, y: 40, width: screenWidth, height: (CGFloat(arr.count)*40.0 + 20.0) > screenHeight - kNaviHeight - 40 ?screenHeight - kNaviHeight - 40:(CGFloat(arr.count)*40.0) )
                            })
                            
                        }else{
                            UIView.animate(withDuration: 0.2, animations: {
                                tableView.frame = CGRect.init(x: 0, y: 40, width: screenWidth, height: 1)
                            })
                            
                        }
                        
                        
                        
                    }
                    
                }else{
                  
                    let tableView = self.viewWithTag(100+i) as! UITableView
                    

                    UIView.animate(withDuration: 0.2, animations: {
                        tableView.frame = CGRect.init(x: 0, y: 40, width: screenWidth, height: 1)
                        self.maskViewSS?.alpha = 0
                    }, completion: { (idCom) in
                        self.maskViewSS?.removeFromSuperview()
                    })
                    
                }
                
            }
            self.addSubview(view)
            
        }
    }
    func setTableView(){
        let totalArry:Array<Array<String>>  = self.tableArray
        
        
        
        for i in 0..<totalArry.count{
        
            let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 40, width: screenWidth, height: 1), style: .plain)
            
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tag = 100+i
            tableView.backgroundColor = UIColor.white
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
            tableView.rowHeight = 40
            tableView.isScrollEnabled = false
            //            tableView.separatorStyle = .none
            self.addSubview(tableView)
            
            
        }
    }
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        var view = super.hitTest(point, with: event)
        if view == nil {
            for subView in self.subviews {
                let tp = subView.convert(point, from: self)
                if subView.bounds.contains(tp) {
                    view = subView
                }
            }
        }
        return view
    }

    
    
}
extension LYDropListView{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let drop = self.viewWithTag(tableView.tag-100+1000) as! LYDropListTItleView
        let cell = tableView.cellForRow(at: indexPath)
        
        drop.title  = cell?.textLabel?.text
        if self.selectClosure != nil {
            self.selectClosure!(tableView.tag,indexPath.row)
        }
        
        drop.isSelected = false
//        self.maskViewSS?.removeFromSuperview()
//        UIView.animate(withDuration: 0.2, animations: {
//            tableView.frame = CGRect.init(x: 0, y: 40, width: screenWidth, height: 1)
//        })
        
        UIView.animate(withDuration: 0.2, animations: {
            tableView.frame = CGRect.init(x: 0, y: 40, width: screenWidth, height: 1)
            self.maskViewSS?.alpha = 0
        }, completion: { (idCom) in
            self.maskViewSS?.removeFromSuperview()
        })
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let drop = self.viewWithTag(tableView.tag-100+1000) as! LYDropListTItleView
        if drop.isSelected == nil {
            return 0
        }else{
            return  drop.isSelected! ? self.tableArray[tableView.tag-100].count : 0
        }

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as UITableViewCell
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.textLabel?.text = tableArray[tableView.tag - 100][indexPath.row]

        return cell
    }
}

