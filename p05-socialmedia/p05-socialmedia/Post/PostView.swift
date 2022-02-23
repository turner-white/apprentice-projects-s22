//
//  PostView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 1/31/22.
//

import SwiftUI

struct PostView: View {
    let post: Post
    @State var isLiked: Bool = false
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Image(post.authorImageAddress)
                    .resizable()
                    .frame(width:50,height:50)
                    .clipShape(Circle())
                VStack (alignment: .leading){
                    Text(post.authorName)
                        .font(.body)
                    Text("@\(post.authorUsername)")
                        .font(.subheadline)
                }
                Spacer()
                Text(post.formattedDate)
            }
            Text(post.postContent)
            HStack {
                Button {
                    isLiked.toggle()
                } label: {
                    Label("\(post.likeCount)", systemImage: isLiked ? "heart.fill" : "heart")
                }.labelStyle(.titleAndIcon)
//                NavigationView {
//                    NavigationLink(destination: CommentView) {
//                        Label("\(post.commentCount)", systemImage: "bubble.right")
//                    }
//                }
                Button {
                    
                } label: {
                    Label("\(post.likeCount)",systemImage: "bubble.right")
                }.labelStyle(.titleAndIcon)
            }
        }
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: .example)
            .bothColorSchemes()
    }
}
