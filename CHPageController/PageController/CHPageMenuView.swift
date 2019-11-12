//
//  CHPageMenuView.swift
//  CHPageController
//
//  Created by hbz on 2019/11/11.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI

struct CHPageMenuView: View {
     var titles :  [PageItem]!
     @State var normalColor : Color = Color.secondary
     @State  var selectedColor : Color?
     @State  var normalFont : Double = 15.0
     @State  var selectedFont : Double = 15.0
     @Binding var currentPage: Int
 
     var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
             HStack(alignment: .center){
                ForEach(self.titles){ item in
                    Text(item.name).onTapGesture {
                        let index : Int = self.titles.firstIndex(where: {$0.name == item.name})!
                        self.currentPage = index
                       
                    }
                    .foregroundColor(CHPageMenuViewModel.isSelected(currentPage: self.currentPage, currentItem: item ,data: self.titles) ? self.selectedColor : self.normalColor).font(.system(size: CHPageMenuViewModel.isSelected(currentPage: self.currentPage, currentItem: item ,data: self.titles) ?CGFloat(self.selectedFont) :CGFloat(self.normalFont)))
                }.padding(.leading,20)
            }
        }.frame(width:UIScreen.main.bounds.width,height: 50)
        
    }
}
 
