//
//  ContentView.swift
//  CHPageController
//
//  Created by hbz on 2019/11/11.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
         
        CHPageController(items.map{DemoListView(item: $0)},items: items ,menuViewconfig: CHMenuViewConfig( selectedColor: Color.red, normalFont: 15, selectedFont: 17))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
