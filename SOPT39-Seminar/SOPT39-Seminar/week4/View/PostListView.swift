//
//  PostListView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/6/26.
//

import SwiftUI

struct PostListView: View {
    @State private var keyword = ""
    @State private var posts: [PostDTO] = PostListResponseDTO.dummy.posts

    var body: some View {
        VStack(spacing: 0) {
            NetworkSearchTextField(text: $keyword)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)

            postList
        }
        .background(Color(.networkWhite))
        .overlay(alignment: .bottomTrailing) {
            NetworkFloatingButton {
            }
            .padding(.trailing, 16)
            .padding(.bottom, 10)
        }
    }

    private var postList: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(posts) { post in
                    NetworkPostCard(
                        author: post.author,
                        date: post.displayDate,
                        title: post.title,
                        content: post.content
                    )
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 90)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    PostListView()
}
