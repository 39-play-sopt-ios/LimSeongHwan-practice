//
//  InstaFeedView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/10/26.
//

import SwiftUI

struct InstaFeedView: View {
    @State private var firstIsLiked = false
    @State private var secondIsLiked = false
    @State private var posts: [PostModel] = examplePopsts
    
    var body: some View {
        ScrollView {
            VStack {
                Image(.logo)
                
                ForEach($posts) { $post in
                    PostCardView(isLiked: $post.isLiked, profileImage: Image(.takho), username: post.username, location: post.location, postImage: Image(post.postImageName), likesText: post.likesText, caption: post.caption, timeText: post.timeText)
                }
                // PostCardView(isLiked: $firstIsLiked, profileImage: Image(.takho), username: "성환", location: "인천 대한민국", postImage: Image(.instapost), likesText: "모아요 님 외 7,777명이 좋아합니다", caption: "피곤해여", timeText: "30분 전")
                // PostCardView(isLiked: $secondIsLiked, profileImage: Image(.takho), username: "이상엽", location: "서울 대한민국", postImage: Image(.instapost), likesText: "모아요 님 외 7,777명이 좋아합니다", caption: "벌써 2차 세미나라니 정말 즐거워요", timeText: "1시간 전")
                Spacer()
            }
        }
    }
}

#Preview {
    InstaFeedView()
}
