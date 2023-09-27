//
//  ContentView.swift
//  RandomUsers
//
//  Created by Alex Archer on 8/21/23.
//

import SwiftUI

struct UsersView: View {
    @StateObject var userData = UserData()
    
    var body: some View {
        NavigationView {
            List(userData.users) { user in
                HStack {
                    if #available(iOS 15.0, *) {
                        AsyncImage(url: URL(string: user.picture.thumbnail)) { image in
                            image.clipShape(Circle())
                        } placeholder: {
                            Image(systemName: "person")
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                    } else {
                        // Fallback on earlier versions
                    }
                    Text(user.fullName)
                }
            }
            .navigationTitle("Random Users")
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
