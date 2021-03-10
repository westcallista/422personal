//
//  SortClass.swift
//  Fetch
//
//  Created by Callista West on 3/9/21.
//

import Foundation
import Swift

@objcMembers class UserSort {
    var dogBreed: String
    var point: Int
    var location: String

    init(dogBreed: String, point: Int, location: String) {
        self.dogBreed = dogBreed
        self.point = point
        self.location = location
    }
}

@objcMembers class CurUser {
    var dogBreed: String
    
    init(dogBreed: String){
        self.dogBreed = "Lab"
    }
}

//let alice = UserSort(dogBreed: "Lab")
//let bob = UserSort(dogBreed: "Poodle")
//let joe = UserSort(dogBreed: "Lab")
//let nancy = UserSort(dogBreed: "Husky")
//let people = [alice, bob, joe, nancy] as NSArray

//let alicePredicate = NSPredicate(format: "dogBreed = 'Lab'")

//people.filtered(using: alicePredicate)
