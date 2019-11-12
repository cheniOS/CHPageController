//
//  CHPageMenuViewModel.swift
//  CHPageController
//
//  Created by hbz on 2019/11/12.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI
import Combine
class    CHPageMenuViewModel: NSObject {
    
    static   func isSelected(currentPage : Int , currentItem : PageItem , data : [PageItem]) -> Bool {
           let index : Int = data.firstIndex(where: {$0.name == currentItem.name})!
        if index == currentPage{
            return true
        }else{
            return false
        }
    }
}

 
