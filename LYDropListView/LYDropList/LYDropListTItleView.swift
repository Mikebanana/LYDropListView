//
//  LYDropListTItleView.swift
//  LYDropListView
//
//  Created by discover on 2017/9/28.
//  Copyright © 2017年 LY. All rights reserved.
//

import UIKit
import SnapKit
typealias GesClosure = (_ selected:Bool)->Void
class LYDropListTItleView: UIView {
    var label:UILabel!
    var icon:UIImageView!
    var ly_width:CGFloat?
    var title:String?{
        didSet{
            self.ly_width = self.getLabWidth(labelStr: self.title!, font: UIFont.systemFont(ofSize: 14), height: 14) + 2
            label.text = self.title
            layout()
        }
    }
    var _isSelect:Bool = false
    var gesClosure:GesClosure?
    var isSelected:Bool?{
        didSet{
            self._isSelect = isSelected!
            if isSelected! {
                UIView.animate(withDuration: 0.2, animations: {
                    self.icon.transform = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi))
                    
                })
            }else{
                UIView.animate(withDuration: 0.2, animations: {
                    self.icon.transform = CGAffineTransform.identity
                    
                })
                
            }
            
            
        }
        
    }
    init(frame: CGRect,title:String) {
        super.init(frame: frame)
        self.title = title
        self.ly_width = self.getLabWidth(labelStr: self.title!, font: UIFont.systemFont(ofSize: 14), height: 14) + 2
        setUI()
        layout()
        setGes()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setGes(){
        let ges = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
     
        self.addGestureRecognizer(ges)
    }
    
    func tapAction(){
        self._isSelect = !self._isSelect
        self.isSelected = self._isSelect
        if (self.gesClosure != nil){
            self.gesClosure!(self.isSelected!)
        }
        
    }
    
    func setUI(){
        
        label = UILabel()
        addSubview(label)
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = self.title
        
        icon = UIImageView.init()
        icon.image = UIImage.init(named:"下箭头灰")
        addSubview(icon)
        
        
        
    }
    func layout(){
        label.snp.removeConstraints()
        icon.snp.removeConstraints()
        label.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.centerX.equalTo(self)
            make.height.equalTo(14)
            make.width.equalTo(ly_width!)
        }
        icon.snp.makeConstraints { (make) in
            make.left.equalTo(label.snp.right).offset(2*suitParm)
            make.centerY.equalTo(label)
            make.width.equalTo(12)
            make.height.equalTo(12)
            
        }
        
        
    }
    func getLabWidth(labelStr:String,font:UIFont,height:CGFloat) -> CGFloat {
        
        let statusLabelText: NSString = labelStr as NSString
        
        let size = CGSize(width:900, height:height)
        
        let dic = NSDictionary(object: font, forKey: NSFontAttributeName as NSCopying)
        
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context: nil).size
        
        return strSize.width
        
    }
}

