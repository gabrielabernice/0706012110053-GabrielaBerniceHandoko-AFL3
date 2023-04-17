//
//  PageControl.swift
//  0706012110053-GabrielaBerniceHandoko-AFL3
//
//  Created by MacBook Pro on 17/04/23.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable{
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    
    // method to create and return a new coordinator
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        
        // adding the coordinator as the target
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject{
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        // implementing objc because uicontrol subclasses are using target action pattern instead of delegation
        @objc
        func updateCurrentPage(sender: UIPageControl){
            control.currentPage = sender.currentPage
        }
    }
}
