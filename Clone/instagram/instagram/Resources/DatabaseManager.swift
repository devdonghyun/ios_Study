//
//  DatabaseManager.swift
//  instagram
//
//  Created by 안동현 on 2022/01/10.
//

import FirebaseDatabase
import CryptoKit

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    //MARK: - Public
    
    
    /// Check if username and email is available
    /// - Parameters
    ///       - email: String Representing email
    ///       - username: String Representing username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        
    }
    
    
    /// Inserts new user data to database
    /// - Parameters
    ///       - email: String Representing email
    ///       - username: String Representing username
    ///       - completion: Async callback for result if database entry succeded

    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email).setValue(["username": username]) { error, _ in
            if error == nil {
                // succeeded
                completion(true)
                return
            } else {
                // failed
                completion(false)
                return
            }
        }
    }
}
