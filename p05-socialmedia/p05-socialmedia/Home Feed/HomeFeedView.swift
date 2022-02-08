//
//  HomeFeedView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 2/1/22.
//

import SwiftUI

struct HomeFeedView: View {
    let posts: [Post] = PostList.defaultPosts
    
    var body: some View {
        NavigationView {
            ZStack (alignment: .bottomTrailing){
                ScrollView {
                    ForEach(posts) { post in
                        PostView(post: post)
                        Divider()
                    }
                }
                NavigationLink(destination: NewPostView()) {
                    Label("plus", systemImage: "plus.circle.fill")
                        .labelStyle(.iconOnly)
                        .foregroundColor(.blue)
                        .imageScale(.large)
                        .background( Circle().fill().foregroundColor(.white))
                        
                }
            }.padding(.leading)
                .padding(.trailing)
                .navigationTitle(Text("BlueBird :)").font(.largeTitle))
                .navigationBarHidden(true)
        }
    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView()
    }
}
