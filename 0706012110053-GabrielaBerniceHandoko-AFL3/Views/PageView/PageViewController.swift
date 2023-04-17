//
//  PageViewController.swift
//  0706012110053-GabrielaBerniceHandoko-AFL3
//
//  Created by MacBook Pro on 17/04/23.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable{
    var pages: [Page]
    
    // calls this function to have access to the coordinator object
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    // creates a ui page view controller
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        // as the data source
        pageViewController.dataSource = context.coordinator
        
        return pageViewController
    }
    
    
    // host the page swiftui view every update
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[0]], direction: .forward, animated: true)
    }
    
    // nested coordinator class
    class Coordinator: NSObject, UIPageViewControllerDataSource{
        var parent: PageViewController
        
        // it is initialized here because the system only initializes once
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map{UIHostingController(rootView: $0)}
        }
        
        // establish relationships between view controllers, so that we can swipe back and forth between landmarks
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else{
                return nil
            }
            if index == 0{
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        // establish relationships between view controllers, so that we can swipe back and forth between landmarks
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else{
                return nil
            }
            if index + 1 == controllers.count{
                return controllers.first
            }
            return controllers[index + 1]
        }
    }
}
