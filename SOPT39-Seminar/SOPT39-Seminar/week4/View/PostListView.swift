//
//  PostListView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/6/26.
//

import SwiftUI

struct PostListView: View {
    @State private var keyword = ""
    @State private var posts: [PostDTO] = []
    @State private var errorMessage = ""
    @State private var isPostSheetPresented = false
    @State private var newTitle = ""
    @State private var newContent = ""
    @State private var selectedPost: PostDTO?

    var body: some View {
        VStack(spacing: 0) {
            NetworkSearchTextField(text: $keyword)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .typography(.m14)
                    .foregroundStyle(Color(.networkRed))
                    .padding(.bottom, 12)
            }

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
            NetworkPostBottomSheet(title: $newTitle, content: $newContent) {
                Task {
                    await createPost()
                }
            }
        }
        .task {
            await fetchPostList()
        }
    }

    private func fetchPostList() async {
        errorMessage = ""

        do {
            let response = try await PostListService.shared.getPostList()
            posts = response.posts
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    private func createPost() async {
        errorMessage = ""

        guard let author = KeychainManager.shared.read(for: .nickname), !author.isEmpty else {
            errorMessage = "닉네임이 없어요. 인증 코드를 먼저 발급해주세요."
            isPostSheetPresented = false
            return
        }

        do {
            _ = try await PostCreateService.shared.postCreatePost(
                title: newTitle,
                content: newContent,
                author: author
            )

            newTitle = ""
            newContent = ""
            isPostSheetPresented = false

            await fetchPostList()
        } catch {
            errorMessage = error.localizedDescription
            isPostSheetPresented = false
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
                onDelete: {}
            )
        }
    }
}

#Preview {
    PostListView()
}
