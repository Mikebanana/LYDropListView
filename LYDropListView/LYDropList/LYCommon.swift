//
//  TDCommon.swift
//  Tudou
//
//  Created by discover on 2017/8/9.
//  Copyright © 2017年 李雨. All rights reserved.
//

import UIKit
//适配参数
 let iphone5  = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:960,height:1336), (UIScreen.main.currentMode?.size)!) : false
let iphone6  = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:750,height:1334), (UIScreen.main.currentMode?.size)!) : false
let iphone6p  = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:1242,height:2208), (UIScreen.main.currentMode?.size)!) : false
let iphone6pBigMode = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:1125,height:2001), (UIScreen.main.currentMode?.size)!) : false
let iphoneX = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:1125,height:2436), (UIScreen.main.currentMode?.size)!) : false


func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat)->UIColor { return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a) }

    
let kNaviHeight:CGFloat = iphoneX ? 88 : 64
let kTabbarHeight:CGFloat = 49
    // 屏幕高度
let screenHeight = iphoneX ? UIScreen.main.bounds.height - 34 : UIScreen.main.bounds.height
    // 屏幕宽度
    let screenWidth = UIScreen.main.bounds.width


let suitParm:CGFloat = (iphone6p ? 1.12 : (iphone6 ? 1.0 : (iphone6pBigMode ? 1.01 : (iphoneX ? 1.0 : 0.85))))




