//
//  ViewController.swift
//  Kijiji
//
//  Created by Bijan Nazem on 2023-02-01.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareSubviews()
    }
    
    // MARK: Private functions
    private func prepareSubviews() {
        let homeViewController = HomeViewController()
        let myKijijiViewController = MyKijijiViewController()
        
        homeViewController.setTabBarItem(systemName: "house", title: "Home")
        myKijijiViewController.setTabBarItem(systemName: "person", title: "My Kijiji")
        
        viewControllers = [homeViewController, myKijijiViewController]
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct MainViewController_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]
    
    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                MainViewController()
            }.previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif

