//
//  CHMenuView.swift
//  CHPageController
//
//  Created by hbz on 2019/11/14.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI

struct CHMenuView: View {
    var titles :  [PageItem]!
        var config : CHMenuViewConfig = CHMenuViewConfig()
        @Binding var currentPage: Int
        @State private var enabled = false
        @State private var dragAmount = CGSize.zero
    var body: some View {
          ScrollView(.horizontal,showsIndicators: false) {
            
                 HStack(spacing: 0) {
                     ForEach(self.titles.indices) { index in
                         Text(self.getItem(index: index).name)
                            .foregroundColor(self.textColor(currentIndex: index))
                            .font(.system(size: self.textSize(currentIndex: index)))
                            .frame(width: self.getItemWidth(index: index))
                            .offset(self.dragAmount)
                            
                            .onTapGesture {
                                
                                     self.currentPage = index
                              
                                
                         }.gesture(
                             DragGesture()
                                 .onChanged { self.dragAmount = $0.translation
                                  print("\(self.dragAmount)")
                             }
                                 .onEnded { _ in
                                     self.dragAmount = .zero
                                     self.enabled.toggle()
                                 }
                         )
                     }
                     
                 }
         
             }
    }
    func getItem(index : Int) -> PageItem {
           let item = self.titles[index]
           return item
       }
    func textColor(currentIndex : Int) -> Color {
        let selected  = self.isSelected(currentIndex: currentIndex)
        return selected ? self.config.selectedColor :  self.config.normalColor
    }
    func textSize(currentIndex : Int) -> CGFloat {
        let selected  = self.isSelected(currentIndex: currentIndex)
        return selected ? self.config.selectedFont :  self.config.normalFont
    }
    func isSelected(currentIndex : Int ) -> Bool {
        if currentIndex == self.currentPage{
            return true
        }else{
            return false
        }
    }
    func getItemWidth(index : Int) -> CGFloat {
        let item = self.titles[index]
        let font = self.config.normalFont > self.config.selectedFont ? self.config.normalFont : self.config.selectedFont
        let width = (CGFloat( item.name.count ) *   font) + self.config.space
        return CGFloat(width)
    }
    func getCurrentWidth(index : Int)->CGFloat {
           var sum  : CGFloat = 0.0
           for subIndex in 0...index{
               
               sum += self.getItemWidth(index: subIndex)
           }
           return sum
       }
}
//
//struct CHMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        CHMenuView()
//    }
//}
