//
//  HomeTabBarController.swift
//  Not Bored
//
//  Created by Facundo Sebastian Acevedo on 09/09/2022.
//

import UIKit


class HomeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addTabItems()
    }
    
    private func setupView(){
        
        tabBar.isTranslucent = false
        
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
        tabBar.barTintColor = .color_background_app
        
        let appareance = UITabBarAppearance()
        
        appareance.backgroundColor = .color_background_app
        appareance.shadowColor = nil
        
        tabBar.scrollEdgeAppearance = appareance
        tabBar.standardAppearance = appareance
        tabBarItem.setTitleTextAttributes([.font : UIFont.boldSystemFont(ofSize: 24 )], for: .normal)
        
        moreNavigationController.setNavigationBarHidden(true, animated: false)
        //navigationController?.setNavigationBarHidden( true , animated: true)
        
    }
    
    private func addTabItems(){
        
        let activityTab = ActivitiesViewController()
        activityTab.title = "Activities"
        
        let activityTab2 = ActivitiesViewController()
        activityTab2.title = "Random"
        
        let viewControllers = [
            BaseNavigationController(rootViewController: activityTab),
            BaseNavigationController(rootViewController: activityTab2)
        ]
        
        setViewControllers( viewControllers , animated: true )
        
        tabBar.items![0].image = UIImage(named: "icon_home")
        tabBar.items![1].image = UIImage(systemName: "arrow.up.forward.circle")
    }
    
}

