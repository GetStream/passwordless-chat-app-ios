//
//  ViewController.swift
//  NoPwdChat
//
//  Created by Matheus Cardoso on 15/03/21.
//

import UIKit
import Auth0
import Lock

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Lock.passwordless(clientId: "1HBJhBfsj1cbypHlSU85L4Ve2YD2RrMh", domain: "dev-fhjteaie.us.auth0.com")
            .withOptions { $0.oidcConformant = true }
            .withConnections { $0.email(name: "email") }
            .withStyle { $0.title = "Passwordless Chat" }
            .onAuth(callback: onAuth)
            .onError { print("Failed with \($0)") }
            .onCancel { print("User cancelled") }
            .onPasswordless { print("Passwordless requested for \($0)") }
            .present(from: self)
    }
    
    func onAuth(_ credentials: Credentials) {
        let window = view.window!

        if let idToken = credentials.idToken {
            fetchStreamJWT(idToken) { token in
                if let token = token {
                    DispatchQueue.main.async {
                        let nav = makeChat(token)
                        
                        UIView.transition(
                            with: window,
                            duration: 0.5,
                            options: .transitionFlipFromLeft,
                            animations: {
                            window.rootViewController = nav
                        })
                    }
                }
            }
        } else {
            print("no token")
        }
    }
}
