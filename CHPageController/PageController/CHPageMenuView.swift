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
     var config : CHMenuViewConfig = CHMenuViewConfig()
     @Binding var currentPage: Int
     @State private var anchor: CGFloat = 0
     @GestureState private var translation: CGFloat?
    private var offset: CGFloat { anchor + (translation ?? 0) }
    private var stackWidth: CGFloat { self.getCurrentWidth(index: self.titles.count - 1 ) }
     var body: some View {
        GeometryReader() { geometry in
            ScrollView(.horizontal,showsIndicators: false){
            HStack(alignment: .center, spacing: 0) {
                ForEach(self.titles.indices) { i in
                    ZStack{

                        Button(action: {
                              self.currentPage = i
//                              self.select()
                        })
                        {Text(self.getItem(index: i).name) .foregroundColor(self.isSelected(currentPage: self.currentPage, currentItem: self.getItem(index: i) ,data: self.titles) ? self.config.selectedColor : self.config.normalColor)}.frame(width: self.getItemWidth(index: i), height: 50).font(.system(size: self.isSelected(currentPage: self.currentPage, currentItem: self.getItem(index: i) ,data: self.titles) ?CGFloat(self.config.selectedFont) :CGFloat(self.config.normalFont)))
                    }.onAppear(){
                       
                    }
                }
            }
            .offset(x: withAnimation{self.select()} )
 
           .position(x:   self.stackWidth/2 , y: geometry.size.height/2)
            }.gesture(
                DragGesture().updating(self.$translation) { value, state, transaction in
                    state = value.translation.width
                    let chor = self.select() +  value.translation.width
//                    self.anchor += value.translation.width

                                       let index = self.slipWithIndex(to: chor)

                                       self.tapSelect(index: index)
                }
                .onEnded { value in
 
                }
            )
        }.frame(height: 50)
    }
    func getItem(index : Int) -> PageItem {
        let item = self.titles[index]
        return item
    }
     
    func select( )->CGFloat  {
        var offset = CGFloat(self.currentPage) * self.getItemWidth(index: self.currentPage)
          
           if offset < ( UIScreen.main.bounds.width/2) {
               offset = 0.0
           }
         else if (offset > UIScreen.main.bounds.width/2 && offset < self.stackWidth - UIScreen.main.bounds.width + self.getItemWidth(index: self.currentPage)){
          offset = offset - UIScreen.main.bounds.width/2 + self.getItemWidth(index: self.currentPage)/2
        }
           else{
              offset = self.stackWidth - UIScreen.main.bounds.width
    
           }
//            anchor = -offset
//           withAnimation(.easeInOut(duration: 0.2)) {
//               anchor = -offset
//           }
        return -offset
       }
    private func slipWithIndex(to offset: CGFloat) -> Int {
        if  (offset < 0){
            return self.titles.count - 1
        }else{
            return 0
        }
      }
    func tapSelect(index: Int) {
           var offset = CGFloat(index) * self.getItemWidth(index: index)
           let maxIndex = Int (UIScreen.main.bounds.width/self.getItemWidth(index: index))
           if index > (self.titles.count - maxIndex-1){
               offset = self.stackWidth - UIScreen.main.bounds.width
           }
                  withAnimation(.easeInOut(duration: 0.2)) {
                      anchor = -offset
            }
       }
    func isSelected(currentPage : Int , currentItem : PageItem , data : [PageItem]) -> Bool {
           let index : Int = data.firstIndex(where: {$0.name == currentItem.name})!
        
        if index == currentPage{
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
 
 
