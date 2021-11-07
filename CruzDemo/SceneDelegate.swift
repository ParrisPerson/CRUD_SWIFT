//
//  SceneDelegate.swift
//  FRAUsuarios
//
//  Created by Borja Fernández on 6/9/21.
//

import UIKit
@available(iOS 13, *)

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        window?.rootViewController = NavigationView(rootViewController: MainWireFrame.createModule())
        window?.makeKeyAndVisible()
        
        let urlToOpen: URL? = connectionOptions.urlContexts.first?.url
        let urlToOpen2: URL? = connectionOptions.userActivities.first?.webpageURL
        
        if urlToOpen == nil && urlToOpen2 == nil {
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.handleURL(urlToOpen != nil ? urlToOpen! : urlToOpen2!)
        })
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb, let urlToOpen = userActivity.webpageURL else {
          return
        }

        handleURL(urlToOpen)
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let urlToOpen = URLContexts.first?.url else { return }
        handleURL(urlToOpen)
    }

    func handleURL(_ url: URL) {
        /*if url.absoluteString.lowercased().range(of:"recuperar?") != nil {
            NotificationCenter.default.post(name: NSNotification.Name.init("Continue.Recover"), object: url.absoluteString, userInfo: nil)
            return
        }
        else {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }*/
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}
