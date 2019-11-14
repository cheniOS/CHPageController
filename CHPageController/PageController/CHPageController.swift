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
    var menuViewConfig : CHMenuViewConfig?
    @State var currentPage = 0

    init(_ views: [Page],items : [PageItem] , menuViewconfig : CHMenuViewConfig) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
        self.titles = items.map{$0}
        self.menuViewConfig = menuViewconfig
    }

    var body: some View {
        VStack {
 
            CHMenuView(titles: titles, config: menuViewConfig ?? CHMenuViewConfig(), currentPage: $currentPage)
            CHPageViewController(controllers: viewControllers, currentPage: $currentPage)
            
        }
    }
}

 struct PageItem : Identifiable  {
      var name  : String
      var id    : Int
 }
  

