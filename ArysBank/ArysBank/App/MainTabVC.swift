//
//  MainTabVC.swift
//  ArysBank
//
//  Created by Жека on 19/07/2023.
//

import UIKit

final class MainTabVC: UITabBarController {
    
    private var menuVC: MainMenuVC = {
        let controller = MainMenuVC()
        let selectedIamge = UIImage(systemName: "creditcard")
        let tabItem = UITabBarItem(title: "News", image: selectedIamge, selectedImage: selectedIamge)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    private var newsVC: FinanceNewsVC = {
        let controller = FinanceNewsVC()
        let selectedIamge = UIImage(systemName: "newspaper")
        let tabItem = UITabBarItem(title: "Home", image: selectedIamge, selectedImage: selectedIamge)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    private var appSettingsVC: AppSettingsVC = {
        let controller = AppSettingsVC()
        let selectedIamge = UIImage(systemName: "wrench.and.screwdriver")
        let tabItem = UITabBarItem(title: "Home", image: selectedIamge, selectedImage: selectedIamge)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        selectedIndex = 1
    }
    
    private func setup(){
        
        let menuNC = UINavigationController(rootViewController: menuVC)
        let newsNC = UINavigationController(rootViewController: newsVC)
        let appSettingsNC = UINavigationController(rootViewController: appSettingsVC)
        menuVC.title = "Home"
        newsVC.title = "Finance news"
        appSettingsVC.title = "Settings"
        newsNC.tabBarItem.title = "Now"
        viewControllers = [newsNC,menuNC, appSettingsNC]
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .gray
    }
}
