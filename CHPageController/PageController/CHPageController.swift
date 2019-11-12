//
//  CHPageController.swift
//  CHPageController
//
//  Created by hbz on 2019/11/11.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI


struct CHPageController<Page: View>: View {
    var titles : [PageItem]
    var viewControllers: [UIHostingController<Page>]
    
    @State var currentPage = 0

    init(_ views: [Page],items : [PageItem]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
        self.titles = items.map{$0}
    }

    var body: some View {
        VStack {
            CHPageMenuView(titles: titles,normalColor: Color.purple,selectedColor: Color.red, normalFont: 15.0, selectedFont: 20.0, currentPage: $currentPage)
            CHPageMenuView(titles: titles, currentPage: $currentPage)
            CHPageViewController(controllers: viewControllers, currentPage: $currentPage)
            
        }
    }
}

 struct PageItem : Identifiable  {
      var name  : String
      var id    : Int
 }
  

