# LYDropListView
iOS Swift 下拉菜单列表
#调用方法
```
   //数据
    let moneyArray:[String] = ["不限金额","0~1000元","1001~2000元","2001~3000元","3001~5000元","5000元以上"]
    let limitArray:[String] = ["不限期限","0~14天","15~30天","30~60天","60~90天","90~180天","180~360天","360天以上"]
    let sortArray:[String] = ["默认排序","贷款成功率 ↓","日费率 ↑"]
     //初始化方法
   //传入一个二维数组即可,一行代码即可生成下拉列表
        let drop = LYDropListView.init(frame: CGRect.init(x: 0, y: kNaviHeight, width: screenWidth, height: 40), tableArr: [self.moneyArray,self.limitArray,self.sortArray], selectClosure: { (tag, row) in
         //tag - 100是第几个标题菜单，row是菜单第几行
              print(tag-100,row)
        })
```
#效果图展示

![LYDropListView.gif](http://upload-images.jianshu.io/upload_images/3095453-8b11c28b6558bf79.gif?imageMogr2/auto-orient/strip)
