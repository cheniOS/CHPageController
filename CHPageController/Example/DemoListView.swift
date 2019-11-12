//
//  DemoListView.swift
//  CHPageController
//
//  Created by hbz on 2019/11/11.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI

struct DemoListView: View {
     var item: PageItem
     var body: some View {
        List(0..<10){_ in
            Text(self.item.name)
        }
    }
}

//struct DemoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        DemoListView(item: items[0])
//    }
//}
