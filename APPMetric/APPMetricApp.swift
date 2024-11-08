//
//  APPMetricApp.swift
//  APPMetric
//
//  Created by Seid GC on 08-11-24.
//
import SwiftUI
import Firebase
import GoogleSignIn

@main
struct GoogleSignInFirebaseSwiftUIApp: App {
    
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            InitialView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool{
        FirebaseApp.configure()
        return true
    }
    
    @available(iOS 9.0, *)
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
    
    
    
}
