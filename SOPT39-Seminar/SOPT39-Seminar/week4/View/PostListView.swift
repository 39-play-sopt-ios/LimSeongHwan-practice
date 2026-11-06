//
//  PostListView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/6/26.
//

import SwiftUI

struct PostListView: View {
    @State private var viewModel = PostListViewModel()
    @State private var isPostSheetPresented = false
    @State private var selectedPost: PostDTO?

    var body: some View {
        VStack(spacing: 0) {
            NetworkSearchTextField(text: $viewModel.keyword)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)

            postList
        }
        .background(Color(.networkWhite))
        .overlay(alignment: .bottomTrailing) {
            NetworkFloatingButton {
                isPostSheetPresented = true
            }
            .padding(.trailing, 16)
            .padding(.bottom, 10)
        }
        .overlay {
            if selectedPost != nil {
                deleteModal
            }
        }
        .sheet(isPresented: $isPostSheetPresented) {
            NetworkPostBottomSheet(title: $viewModel.newTitle, content: $viewModel.newContent) {
                Task {
                    await viewModel.createPost()
                    isPostSheetPresented = false
                }
            }
        }
        .task {
            await viewModel.fetchPostList()
        }
        .navigationBarBackButtonHidden()
    }

    private var postList: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(viewModel.posts) { post in
                    NetworkPostCard(
                        author: post.author,
                        date: post.displayDate,
                        title: post.title,
                        content: post.content
                    )
                    .onLongPressGesture {
                        selectedPost = post
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 90)
        }
        .scrollIndicators(.hidden)
    }

    private var deleteModal: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()

            NetworkPostModal(
                onCancel: { selectedPost = nil },
                onDelete: {
                    guard let post = selectedPost else { return }
                    Task {
                        await viewModel.deletePost(post)
                        selectedPost = nil
                    }
                }
            )
        }
    }
}

#Preview {
    PostListView()
}
