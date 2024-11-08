//
//  AuthenticationView.swift
//  APPMetric
//
//  Created by Seid GC on 08-11-24.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn

class AuthenticationView: ObservableObject{
    
    @Published var isLoginSuccessed = false
    
    
    func signInWithGoogle(){
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: Application_utility.rootViewController) { user, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard
                let user = user?.user,
                let idToken = user.idToken else { return }
            
            let accessToken = user.accessToken
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { res, error in
                if let error = error{
                    print(error.localizedDescription)
                    return
                }
                guard let user = res?.user else { return }
                print(user)
            }
        }
        
    }
    
    func logout() async throws{
        GIDSignIn.sharedInstance.signOut()
        try Auth.auth().signOut()
    }
   
}
