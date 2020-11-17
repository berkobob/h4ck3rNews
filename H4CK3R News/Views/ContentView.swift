//
//  ContentView.swift
//  H4CK3R News
//
//  Created by Antoine Lever on 16/10/2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }

                }
            }
            .navigationBarTitle("H4CK3R News")
        }
        .onAppear(perform: {
            networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//let posts = [
//    Post(id: "1", title: "First"),
//    Post(id: "2", title: "Second"),
//    Post(id: "3", title: "Third")
//]
