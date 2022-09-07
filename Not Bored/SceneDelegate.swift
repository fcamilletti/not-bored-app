//
//  SceneDelegate.swift
//  Not Bored
//
//  Created by Franco Camilletti on 07/09/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowsScene)

        let mainViewController = LoginViewController()
        
        window?.rootViewController = mainViewController
        
        window?.makeKeyAndVisible()
    }

}

