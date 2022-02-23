//
//  PostsService.swift
//  p05-socialmedia
//
//  Created by Turner White on 2/22/22.
//

import Foundation

struct PostsService {
    private static var posts: [Post] = []
    static func getHomeFeed() -> [Post] {
        return self.posts
    }
    static func makePost(post: Post) {
        posts.insert(post, at: 0)
    }
}
