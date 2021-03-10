//
//  SwiftUIView.swift
//  Fetch
//
//  Created by Ronny on 2/24/21.
//

import SwiftUI

struct CurrentUsers: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: CurrentUser.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \CurrentUser.created, ascending: true)]) var users: FetchedResults<CurrentUser>
    @State private var username = "Joe"
    @State private var created = ""
    @State private var dogname = "Buddy"
    @State private var dogbreed = "Golden Retriever"
    @State private var city = "Eugene"
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    
                    //Section below adds boxes for inputting data
                    HStack {
                        Text("Owner:").padding(.trailing, 20)
//                        Image(systemName: "person.fill").foregroundColor(Color.black)
                        TextField("", text: self.$username).foregroundColor(.black)
                    }.padding()
                     .background(Color.blue)
                     .cornerRadius(100)
                     .opacity(0.9)
                    .padding(.bottom, 15)
                    HStack {
                        Text("Dog Name:").padding(.trailing, 20)
//                        Image(systemName: "person.fill").foregroundColor(Color.black)
                        TextField("", text: self.$dogname).foregroundColor(.black)
                    }.padding()
                     .background(Color.blue)
                     .cornerRadius(100)
                     .opacity(0.9)
                    .padding(.bottom, 15)
                    HStack {
                        Text("Breed:").padding(.trailing, 20)
//                        Image(systemName: "person.fill").foregroundColor(Color.black)
                        TextField("", text: self.$dogbreed).foregroundColor(.black)
                    }.padding()
                     .background(Color.blue)
                     .cornerRadius(100)
                     .opacity(0.9)
                    .padding(.bottom, 15)
                    HStack {
                        Text("Location:").padding(.trailing, 20)
//                        Image(systemName: "person.fill").foregroundColor(Color.black)
                        TextField("", text: self.$city).foregroundColor(.black)
                    }.padding()
                     .background(Color.blue)
                     .cornerRadius(100)
                     .opacity(0.9)
                    .padding(.bottom, 15)
                    // **** End *****
                    
                    //Section below creates button to display created users
                    
                }
            }
        }
    }



}

struct SwiftUIView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \User.breed, ascending: true), NSSortDescriptor(keyPath: \User.city, ascending: true), NSSortDescriptor(keyPath: \User.created, ascending: true)]) var users: FetchedResults<User>
    //NSSortDescriptor(keyPath: \User.userOrder, ascending: true),

    @State private var username = ""
    @State private var password = ""
    @State private var dogname = ""
    @State private var breed = ""
    @State private var created = ""
    @State private var city = ""
    @State public var point = Int16()
    @State public var petarray = [User]()
    
    //@State public var pointarray = [Int]()
    //@State private var curDogbreed = "Lab"
    
    //var breedarray = [""]
    
    
    var body: some View {
        VStack {
            NavigationView {
                List{
                    //ForEach(self.users.indices) { index in
                    VStack {
                        
                        //Section below adds boxes for inputting data
                        HStack {
                            Text("UserName:").padding(.trailing, 20)
    //                        Image(systemName: "person.fill").foregroundColor(Color.black)
                            TextField("", text: self.$username).foregroundColor(.black)
                        }.padding()
                         .background(Color.blue)
                         .cornerRadius(100)
                         .opacity(0.9)
                         .padding(.bottom, 15)
                        
                        HStack {
                            Text("dogname:").padding(.trailing, 25)
                            TextField("", text: self.$dogname).foregroundColor(.black)
                        }.padding()
                         .background(Color.blue)
                         .opacity(0.9)
                         .cornerRadius(100)
                         .padding(.bottom, 15)
                        
                        HStack {
                            Text("breed:").padding(.trailing, 25)
                            TextField("", text: self.$breed).foregroundColor(.black)
                        }.padding()
                         .background(Color.blue)
                         .opacity(0.9)
                         .cornerRadius(100)
                         .padding(.bottom, 30)
                        HStack {
                            Text("city:").padding(.trailing, 25)
                            TextField("", text: self.$city).foregroundColor(.black)
                        }.padding()
                         .background(Color.blue)
                         .opacity(0.9)
                         .cornerRadius(100)
                         .padding(.bottom, 30)
                        //**** End ****
                        
                        // Section below adds usernames to coredata
                        Button(action: {
                            let user = User(context: self.managedObjectContext)
                            user.name = self.username
                            user.dogName = self.dogname
                            user.breed = self.breed
                            //var breed1 = user.breed
                            //breedarray.append(user.breed)
                            user.city = self.city
                            user.point = 0
                            user.created = Date()
                            try? self.managedObjectContext.save()
                            print(user)
                            self.petarray.append(user)
                            //self.pointarray.append(user.point)
                            //breedarray.append(breed1)
                            self.dogname = ""
                            self.breed = ""
                            self.city = ""
                            //let curr_user = currentUser(context: self.managedObjectContext)
                            //curr_user.name = self.username
                            //print(curr_user)
                            self.username = ""
                        }) {
                        Text("Submit")
                            .font(Font.custom("Georgia", size: 40.0, relativeTo: .headline))
                            .italic()
                            .padding(.all, 20)
                            .background(Color.purple)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .padding(.bottom, 15)
                        }
                        Button(action: { createSort(array: petarray) }) {
                        //Button(action: { createSort(array: breedarray, parray: pointarray) }) {
                            Text("Sort")
                                .foregroundColor(.green)
                                .padding()
                                .border(Color.green, width: 2)
                                //.offset(x: 150, y: -65)
                        }.buttonStyle(BorderlessButtonStyle())
                    // **** End *****
                    
                    //Section below creates button to display created users
                    NavigationLink(destination: JoinedUsers(totalusers: self.users)) {
                        Text("Show Users")
                            .frame(minWidth: 0, maxWidth: 200)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(40)
                            .padding(.bottom, 15)
                            .font(.title)
                        }
                        NavigationLink(destination: JoinedUsers(totalusers: self.users)) {
                            Text("Recommened Users")
                                .frame(minWidth: 0, maxWidth: 200)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(40)
                                .padding(.bottom, 15)
                                .font(.title)
                        }
                    // **** End ****
                    }
            
                //}.onMove( perform: move)
                }
            }
        }
    }
    

//Actually removes the information, whereas JoinedUsers' version invokes the
//delete button
func removeUsername(at offsets: IndexSet) {
    for index in offsets {
        let user = users[index]
        managedObjectContext.delete(user)
    }
}

//let people = UserSort(dogBreed: "breed")
    
        
    
    func createSort(array: [User]) {
    //func createSort(array: [String], parray: [Int]) {
    //var array = [""]
    //for index in array {
    //    array.append(users[index].breed)
    //}
    var somematch = [User]()
    //let alice = CurUser(dogBreed: "Husky")
    let alice = UserSort(dogBreed: "Lab",  point: 0, location: "Eugene")
    let bob = UserSort(dogBreed: "Poodle", point: 0, location: "Seattle")
    let joe = UserSort(dogBreed: "Lab", point: 0, location: "Bend")
    let nancy = UserSort(dogBreed: "Husky", point: 0, location: "Eugene")
    //let person = [bob, joe, nancy] as NSArray
    let person = [bob, joe, nancy]
    
    //let alicePredicate = NSPredicate(format: "dogBreed = 'Lab'")
    //print("is this working")
    //print(person.filtered(using: alicePredicate))
    //ForEach(User)
    print(array)
    for item in array {
        if alice.dogBreed == item.breed {
            //print("match")
            item.point += 1
        }
        if alice.location == item.city {
            item.point += 1
        }
        else {
            print("no match")
        }
        //if alice.location == item.location {
        //    item.point += 1
        //}
        print(item.city)
        print(item.breed)
        print("points: ")
        print(item.point)
    }
    for item in array {
        if item.point == 2 {
            somematch.append(item)
        }
    }
    for item in array {
        if item.point == 1 {
            somematch.append(item)
        }
    }
    for item in array {
        if item.point == 0 {
            somematch.append(item)
        }
    }
    print(somematch)
    
//    for item in person {
//        if alice.dogBreed == item.dogBreed {
//            print("match")
//            item.point += 1
//        }
//        else {
//            print("no match")
//        }
//        if alice.location == item.location {
//            item.point += 1
//        }
//        //print(item)
//        print("points: ")
//        print(item.point)
//    }
    }
    //private func move(from source: IndexSet, to destination: Int)
//{
//    var revisedItems: [User] = users.map{ $0 }
    
//    revisedItems.move(fromOffsets: source, toOffset: destination)
    
//    for reverseIndex in stride(from: revisedItems.count - 1, through: 0, by: -1){
//        revisedItems[reverseIndex].userOrder = Int16(reverseIndex)
//    }
//}

    
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
}
