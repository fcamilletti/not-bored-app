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
        tabBar.unselectedItemTintColor = .black
        tabBar.barTintColor = .color_background_app
        
        let appareance = UITabBarAppearance()
        
        appareance.backgroundColor = .seconday_color
        appareance.shadowColor = nil
        
        let itemAppareance = UITabBarItemAppearance()
        itemAppareance.normal.titleTextAttributes = [ .foregroundColor : UIColor.darkGray ]
        itemAppareance.selected.titleTextAttributes = [ .foregroundColor : UIColor.black ]
        
        appareance.stackedLayoutAppearance = itemAppareance
        
        tabBar.scrollEdgeAppearance = appareance
        tabBar.standardAppearance = appareance
    
        tabBarItem.setTitleTextAttributes(
            [.font : UIFont.boldSystemFont(ofSize: 24 ) ], for: .normal)

        moreNavigationController.setNavigationBarHidden(true, animated: false)
        
    }
    
    private func addTabItems(){
        
        let activityTab = ActivitiesViewController()
        activityTab.tabBarItem.title = "Activities"
        
        let suggestTab = SuggestionsViewController()
        suggestTab.tabBarItem.title = "Random"

        
        let viewControllers = [
            activityTab,
            suggestTab
        ]
        
        setViewControllers( viewControllers , animated: true )
        
        tabBar.items![0].image = UIImage(named: "icon_home")
        tabBar.items![1].image = UIImage(systemName: "arrow.up.forward.circle")
    }
    
}

