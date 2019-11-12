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
    let item1 = PageItem.init(name: "热门", id: 0)
    let item2 = PageItem.init(name: "推荐", id: 1)
    let item3 = PageItem.init(name: "介绍", id: 2)
    return [item1,item2,item3]
}

