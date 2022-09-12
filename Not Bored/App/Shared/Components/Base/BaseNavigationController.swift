//
//  BaseNavigationController.swift
//  Not Bored
//
//  Created by Facundo Sebastian Acevedo on 09/09/2022.
//

import Foundation
import UIKit

class BaseNavigationController : UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = .color_background_app
        navigationBar.shadowImage = UIImage()
        navigationBar.barTintColor = .color_background_app
        
        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = .seconday_color
    
        appearence.titleTextAttributes = [ .font : UIFont.boldSystemFont(ofSize: 28)]
        
        navigationBar.standardAppearance = appearence
        navigationBar.scrollEdgeAppearance = appearence
        

        
    }
    
}
