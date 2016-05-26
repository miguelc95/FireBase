//
//  ViewController.swift
//  Demo
//
//  Created by Cuellar Gauna on 26/05/16.
//  Copyright © 2016 MC. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class GoogleSignInViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var signInButton: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        let loginButton = FBSDKLoginButton()
       // loginButton.delegate=self
        
    
        
        let button   = GIDSignInButton() //SIGN IN BUTTON GOOGLE
        button.frame=CGRectMake(102, 400, button.frame.width, button.frame.height)
        
        if let user = FIRAuth.auth()?.currentUser {
            print(user.displayName)
            print(user.email)
            print(user.photoURL)
            
            // Do NOT use this value to authenticate with
            // your backend server, if you have one. Use
            // getTokenWithCompletion:completion: instead.
        } else {
            // No user is signed in.
            print("hola")
        }
          //  try! FIRAuth.auth()!.signOut() //SIGNOUT

        self.view.addSubview(button)
        
        
        
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
            
        
        
    
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credentialWithIDToken(authentication.idToken,
                                                                     accessToken: authentication.accessToken)
        FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
            // ...
            let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
            
            FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
                // ...
                print(user?.displayName)
            }
        
                    }
        // ...
    }
    
    
    


}

