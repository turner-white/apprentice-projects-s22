//
//  HomeFeedView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 2/1/22.
//

import SwiftUI

struct HomeFeedView: View {
    @StateObject var vm = HomeFeedViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(vm.posts) { post in
                    PostView(post: post)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .refreshable {
                await vm.fetchPosts()
            }
            .navigationTitle("bluebird")
        }
    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView().bothColorSchemes()
    }
}
