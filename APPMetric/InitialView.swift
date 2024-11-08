//
//  InitialView.swift
//  APPMetric
//
//  Created by Seid GC on 08-11-24.
//
import SwiftUI
import Firebase
import FirebaseAuth


struct InitialView: View {
    @State private var userLoggedIn = (Auth.auth().currentUser != nil)
    
    
    var body: some View {
        VStack{
            if userLoggedIn{
                ContentView()
            } else {
                LoginView()
            }
            
            
        }.onAppear{
            
            Auth.auth().addStateDidChangeListener{auth, user in
            
                if (user != nil) {
                    
                    userLoggedIn = true
                } else{
                    userLoggedIn = false
                }
            }
        }
    }
}
