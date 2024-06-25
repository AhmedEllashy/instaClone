//
//  MainTabBarController.swift
//  Insta
//
//  Created by Ahmad Ellashy on 14/06/2024.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    private func setupTabs(){
        let browse = createNavigationBarItem(with: "", and: UIImage(systemName: "house.fill"), vc: BrowseViewController())
        let search = createNavigationBarItem(with: "", and: UIImage(systemName: "magnifyingglass"), vc: SearchViewController())

        setViewControllers([browse,search], animated: true)
    }
    
    private func createNavigationBarItem(with title: String,and image: UIImage?, vc: UIViewController) -> UINavigationController{
        tabBar.barStyle = .default
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }

}
