//
//  Data.swift
//  CHPageController
//
//  Created by hbz on 2019/11/11.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI
import Foundation
let items: [PageItem] = addTestData()

func addTestData()-> [PageItem]{
    let item1 = PageItem.init(name: "热门视频", id: 0)
    let item2 = PageItem.init(name: "推荐", id: 1)
    let item3 = PageItem.init(name: "介绍", id: 2)
    let item4 = PageItem.init(name: "体育", id: 3)
    let item5 = PageItem.init(name: "经济", id: 4)
    let item6 = PageItem.init(name: "贸易", id: 5)
    let item7 = PageItem.init(name: "搜索", id: 6)
    let item8 = PageItem.init(name: "财经", id: 7)
    let item9 = PageItem.init(name: "汽车", id: 8)
    let item10 = PageItem.init(name: "财经1", id: 9)
    let item11 = PageItem.init(name: "汽车2", id: 10)
    return [item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item11]
}

