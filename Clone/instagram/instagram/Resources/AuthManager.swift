//
//  AuthManager.swift
//  instagram
//
//  Created by 안동현 on 2022/01/10.
//

import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    //MARK: - Public
    
    public func registerNewUser(username: String, email: String, password: String) {
        /*
         - Check if username is available
         - Check if email is available
         - Create account
         - Insert account to database
         */
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping ((Bool) -> Void)) {
        if let email = email {
            // email log in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
            
        } else if let username = username {
            // username log in
            print(username)
        }
        
    }
    
    
}
