//
//  CHPageViewController.swift
//  CHPageController
//
//  Created by hbz on 2019/11/11.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI
import UIKit
struct CHPageViewController: UIViewControllerRepresentable {
    var controllers: Array<UIViewController>!
    @Binding var currentPage: Int
   func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator

        return pageViewController
    }
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        var direction  = UIPageViewController.NavigationDirection.forward
        if let vcs = pageViewController.viewControllers{
            if let last = vcs.last{
                if let index = controllers.firstIndex(of: last) {
                    direction = currentPage > index ? .forward : .reverse
                }
            }
        }
        
        pageViewController.setViewControllers(
            [controllers[currentPage]], direction: direction, animated: true)
    }

    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: CHPageViewController

        init(_ pageViewController: CHPageViewController) {
            self.parent = pageViewController
        }

        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController? {
            var index = self.parent.controllers.firstIndex(of: viewController)
                  if index == NSNotFound || index == 0 {
                      return nil
                  }
                  
                  index = index! - 1
                  return self.parent.controllers[index!]
        }

        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController? {
            var index = self.parent.controllers.firstIndex(of: viewController)
                  if index! == NSNotFound {
                      return nil
                  }
                  
            if index! + 1 >= self.parent.controllers.count {
                      return nil
                  }
                  
                  index = index! + 1
            return self.parent.controllers[index!]
        }

        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
                let visibleViewController = pageViewController.viewControllers?.first,
                let index = parent.controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}

 
