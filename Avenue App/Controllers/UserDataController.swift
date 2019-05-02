//
//  UserDataController.swift
//  Avenue App
//
//  Created by Adegboyega Olusunmade on 30/04/2019.
//  Copyright © 2019 Gboyega. All rights reserved.
//

import Foundation
import RealmSwift


class UserDataController{
    
    
    static func createUser(firstName:String,lastName:String,email:String,id:String){
        deleteUser()
        let realm = try! Realm()
        let user = User()
        user.firstName = firstName
        user.lastName = lastName
        user.email = email
        user.ID = id
        
        do {
            try realm.write {
                realm.add(user)
            }
        } catch {
            print(error.localizedDescription)
        }

        
    }
    
    static func deleteUser(){
        let realm = try! Realm()
        let items = realm.objects(User.self)
        do{
            try realm.write {
                realm.delete(items)
            }
        }
        catch{
            print(error.localizedDescription)
        }

        
    }
    
    
    static func loadFirstName() -> String {
        let realm = try! Realm()
        let items = realm.objects(User.self)
        guard let user = items.first else {
            fatalError("No User Defined in app")
        }
        
        return user.firstName
    }
    static func loadLastName() -> String {
        let realm = try! Realm()
        let items = realm.objects(User.self)
        guard let user = items.first else {
            fatalError("No User Defined in app")
        }
        return user.lastName
    }
    static func loadEmail() -> String{
        let realm = try! Realm()
        let items = realm.objects(User.self)
        guard let user = items.first else {
            fatalError("No User Defined in app")
        }
        return user.email
    }
    static func updateFirstName(firstName:String){
        let realm = try! Realm()
        let items = realm.objects(User.self)
        guard let user = items.first else {
            fatalError("No User Defined in app")
        }
        
        do{
            try realm.write {
                user.firstName = firstName
            }
        }
        catch{
            print(error.localizedDescription)
        }
    }
    static func updateLastName(lastName:String){
        let realm = try! Realm()
        let items = realm.objects(User.self)
        guard let user = items.first else {
            fatalError("No User Defined in app")
        }
        
        do{
            try realm.write {
                user.lastName = lastName
            }
        }
        catch{
            print(error.localizedDescription)
        } 
    }
}
