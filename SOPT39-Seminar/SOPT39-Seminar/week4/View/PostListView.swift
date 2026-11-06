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
    @State private var isPostSheetPresented = false
    @State private var newTitle = ""
    @State private var newContent = ""
    @State private var selectedPost: PostDTO?

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
        do {
            let response = try await PostListService.shared.getPostList()
            posts = response.posts
        } catch {
            print("게시글 목록 조회 실패:", error.localizedDescription)
        }
    }

    private func createPost() async {
        guard let author = KeychainManager.shared.read(for: .nickname), !author.isEmpty else {
            print("게시글 생성 실패: 저장된 닉네임이 없어요.")
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
            print("게시글 생성 실패:", error.localizedDescription)
            isPostSheetPresented = false
        }
    }

    private func deletePost() async {
        guard let post = selectedPost else { return }

        do {
            try await PostDeleteService.shared.deletePost(postId: post.id)
            selectedPost = nil

            await fetchPostList()
        } catch {
            print("게시글 삭제 실패:", error.localizedDescription)
            selectedPost = nil
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
                onDelete: {
                    Task {
                        await deletePost()
                    }
                }
            )
        }
    }
}

#Preview {
    PostListView()
}
