//
//  UserInfo.swift
//  Fetch
//
//  Created by Ronny on 2/25/21.
//

import SwiftUI
import UIKit

struct JoinedUsers: View {
    @State var totalusers: FetchedResults<User>
    @Environment(\.managedObjectContext) var managedObjectContext
    //@FetchRequest(entity: CurrentUser, sortDescriptors: [NSSortDescriptor(keyPath: \CurrentUser.breed, ascending: true)]) var totalusers: FetchedResults<CurrentUser>
    
    var body: some View {
        List {
            ForEach(self.totalusers.indices) { index in
                VStack (alignment: .leading){
                    Text("Owner: \(self.totalusers[index].name)")
                    Text("Dog: \(self.totalusers[index].dogName)")
                    Text("Breed: \(self.totalusers[index].breed)")
                    Text("Location: \(self.totalusers[index].city)")
                }
            }.onDelete(perform: removeUsername)
        }
        //Section below creates button to display matching critera
        NavigationLink(destination: MatchingUsers(totalusers: self.totalusers)) {
            Text("Matching Functionality")
                .frame(minWidth: 0, maxWidth: 200)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(40)
                //.font(.title)
        }
        // **** End ****
    }
    // Functionality to delete a user
    
    func removeUsername(at offsets: IndexSet) {
        for index in offsets {
            let user = totalusers[index]
            managedObjectContext.delete(user)
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }
}

//struct JoinedUsers_Previews: PreviewProvider {
//    static var previews: some View {
//        let context = User.
//        JoinedUsers()
//    }
//}

//
//List {
//    ForEach(self.users.indices) { index in
//        Text("\(self.users[index].name!)")
//    }.onDelete(perform: removeUsername)
//}
